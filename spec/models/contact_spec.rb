require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'is a thing' do
    expect{Contact.new}.to_not raise_error
  end

  it 'has name has surname has email has address' do
    contact = Contact.new
    contact.name = 'Bill'
    contact.surname = 'Nye'
    contact.email = 'BillNye@scienceguy.com'
    contact.address = '123 First Street'
    expect(contact.save).to eq true
    c1 = Contact.find_by_name 'Bill'
    expect(c1.name).to eq 'Bill'
    expect(c1.surname).to eq 'Nye'
    expect(c1.email).to eq 'BillNye@scienceguy.com'
    expect(c1.address).to eq '123 First Street'
  end
end
