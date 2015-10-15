class Preuser < ActiveRecord::Base
    before_save { self.email.downcase! }
    
    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." } 
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code

    REFERRAL_STEPS = [
        {
            'count' => 5,
            "html" => "Limited Edition Toothbrush",
            "class" => "two",
            "image" =>  "Tulip_Brush_Orange.png",
            "check" => "check-icon-new-light-blue.png"
        },
        {
            'count' => 10,
            "html" => "Toothpaste &amp; Floss",
            "class" => "three",
            "image" =>  "Tulip_Brush_Light_Blue.png",
            "check" => "check-icon-new-light-blue.png"
        },
        {
            'count' => 25,
            "html" => "6-Month Supply",
            "class" => "four",
            "image" =>  "tulip-regimen-3.png",
            "check" => "check-icon-new-light-blue.png"
        },
        {
            'count' => 50,
            "html" => "1-Year Supply",
            "class" => "five",
            "image" =>  "tulip-regimen-4.png",
            "check" => "check-icon-new-light-blue.png"
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
end
