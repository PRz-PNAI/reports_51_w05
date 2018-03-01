FactoryBot.define do
  factory :report do
    first_name "Bolesław"
    last_name "Chrobry"
    email "BoleslawChrobry@piastowie.gov"
    content "Testowa treść sprawozdania. " * 20
  end
end
