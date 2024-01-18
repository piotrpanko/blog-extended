module User::Contract
  class Create < Reform::Form
    property :name
    property :email

    validates :name, length: 1..100
  end
end