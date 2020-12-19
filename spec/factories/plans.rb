FactoryBot.define do
  factory :plan do
    title { '旅行' }
    content { '記事の内容' }
    cost { '2000' }

    after(:build) do |plan|
      plan.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
