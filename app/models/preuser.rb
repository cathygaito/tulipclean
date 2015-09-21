class Preuser < ActiveRecord::Base
	belongs_to :referrer, :class_name => "Preuser", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "Preuser", :foreign_key => "referrer_id"

    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." } 
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code
    #after_create :send_welcome_email

    REFERRAL_STEPS = [
        {
            'count' => 5,
            "html" => "Black<br>Mug",
            "class" => "two",
            "image" =>  "black.jpg"
        },
        {
            'count' => 10,
            "html" => "Grey<br>Mug",
            "class" => "three",
            "image" => "gray.jpg"
        },
        {
            'count' => 25,
            "html" => "Orange<br>Mug",
            "class" => "four",
            "image" => "orange.jpg"
        },
        {
            'count' => 50,
            "html" => "Mint<br>Toothpaste",
            "class" => "five",
            "image" => "mint.jpg"
        }
    ]

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = Preuser.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = Preuser.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end

    #def send_welcome_email
    #    UserMailer.delay.signup_email(self)
    #end
end
