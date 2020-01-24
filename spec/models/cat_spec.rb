require 'rails_helper'

RSpec.describe Cat, type: :model do
      it "should validate name" do
        cat_one = Cat.create(city: 'Orange', age: 4, bio: 'hey')
        expect(cat_one.errors[:name]).to_not be_empty
      end
      it "should validate age" do
        cat_two = Cat.create(name: 'monkey', city: 'Orange', bio: 'hey')
        expect(cat_two.errors[:age]).to_not be_empty
      end
      it "should validate city" do
        cat_three = Cat.create(name: 'monkey', age: 4, bio: 'hey')
        expect(cat_three.errors[:city]).to_not be_empty
      end
      it "should validate bio" do
        cat_four = Cat.create(name: 'monkey', city: 'Orange', age: 4)
        expect(cat_four.errors[:bio]).to_not be_empty
      end
      it "needs a bio longer than 10 characters" do
          cat_five = Cat.create(name: 'monkey', city: 'Orange', age: 4, bio: 'hey')
          expect(cat_five.errors[:bio]).to include ("is too short (minimum is 10 characters)")
      end
    end
