class InstitutionCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '病院' },
    { id: 3, name: '診療所' },
  ]
  end