class Specialty < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '内科' },
    { id: 3, name: '外科' },
    { id: 4, name: '循環器内科' },
    { id: 5, name: '整形外科' }
  ]

  include ActiveHash::Associations
  has_many :doctors
end
