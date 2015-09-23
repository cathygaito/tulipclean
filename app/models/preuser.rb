class Preuser < ActiveRecord::Base

    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." } 
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code

    REFERRAL_STEPS = [
        {
            'count' => 5,
            "html" => "Toothbrush",
            "class" => "two",
            "image" =>  "black.jpg"
        },
        {
            'count' => 10,
            "html" => "Toothpaste &amp; Floss",
            "class" => "three",
            "image" => "gray.jpg"
        },
        {
            'count' => 25,
            "html" => "6-Month Toothpaste Supply",
            "class" => "four",
            "image" => "orange.jpg"
        },
        {
            'count' => 50,
            "html" => "1-Year Toothpaste Supply",
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
end
