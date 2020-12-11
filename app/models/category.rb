class Category < ActiveHash::Base
  
    self.data = [
      { id: 0, name: '----' },
      { id: 1, name: '国内旅行' },
      { id: 2, name: '海外旅行' },
    ]
    
      include ActiveHash::Associations
      has_many :plans
      end
