FactoryBot.define do
  factory :report do
    first_name "Bolesław"
    last_name "Chrobry"
    email "BoleslawChrobry@piastowie.gov"
    content "Testowa treść sprawozdania. " * 20

    trait :grade do
      grade "3.5"
    end
    trait :comment do
      comment "Niezłe sprawozdanie. Tylko, że nie na temat..."
    end
  end
end
