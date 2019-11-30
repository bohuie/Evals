FactoryBot.define do
    factory :user do
        first_name { "Jane" }
        last_name {"Doe" }
        admin { false }

        factory :valid_user do
            email { "jane.doe@localhost.com" }
            password { "janespassword" }
        end
    end
end