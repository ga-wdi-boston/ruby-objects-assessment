require_relative '../lib/assessment.rb'

RSpec.describe Dog do
  let(:name) { "Fido" }
  let(:breed) { "Mutt" }
  let(:age) { 10 }

  subject(:fido) { Dog.new(name, breed, age) }

  it 'is a dog' do
    expect(subject).to be_a(Dog)
  end

  it 'has required attributes' do
    expect(subject.instance_variables).to include(:@name)
    expect(subject.instance_variables).to include(:@breed)
    expect(subject.instance_variables).to include(:@age)
  end

  it 'has no getters or setters for required attributes' do
    expect { subject.name }.to raise_error(NoMethodError)
    expect { subject.name = "Lassie" }.to raise_error(NoMethodError)
    expect { subject.breed }.to raise_error(NoMethodError)
    expect { subject.breed = "Collie" }.to raise_error(NoMethodError)
    expect { subject.age }.to raise_error(NoMethodError)
    expect { subject.age = 7 }.to raise_error(NoMethodError)
  end
end

RSpec.describe Person do
  let(:name) { "Jeff" }
  let(:age) { 29 }
  let(:location) { "Boston" }

  subject(:jeff) { Person.new(name, age, location) }

  it 'is a person' do
    expect(subject).to be_a(Person)
  end

  it 'has required attributes' do
    expect(subject.instance_variables).to include(:@name)
    expect(subject.instance_variables).to include(:@age)
    expect(subject.instance_variables).to include(:@location)
  end

  it 'has setters for name and age' do
    expect { subject.name = "Matt" }.not_to raise_error
    expect { subject.location = "Cambridge" }.not_to raise_error
  end

  it 'has a getter for age' do
    expect { subject.age }.not_to raise_error
  end

  it 'has no setters and getters otherwise' do
    expect { subject.name }.to raise_error(NoMethodError)
    expect { subject.location }.to raise_error(NoMethodError)
    expect { subject.age = 30 }.to raise_error(NoMethodError)
  end
end

RSpec.describe Developer do
  let(:name) { "Jeff" }
  let(:age) { 29 }
  let(:location) { "Boston" }

  subject(:jeff) { Developer.new(name, age, location) }

  it 'is a person' do
    expect(subject).to be_a(Developer)
    expect(subject).to be_a(Person)
  end

  it 'has required attributes' do
    expect(subject.instance_variables).to include(:@name)
    expect(subject.instance_variables).to include(:@age)
    expect(subject.instance_variables).to include(:@location)
  end

  it 'has .hire_for_job' do
    expect { subject.hire_for_job }.not_to raise_error
  end
end

RSpec.describe Answer do
  it 'has a dog' do
    expect(Answer.dog).to be_a(Dog)
  end

  it 'has dave' do
    expect(Answer.dave).to be_a(Person)
    expect(Answer.dave.instance_variable_get(:@name)).to eq("Dave")
    expect(Answer.dave.instance_variable_get(:@age)).to eq(32)
    expect(Answer.dave.instance_variable_get(:@location)).to eq("Somerville")
  end
end
