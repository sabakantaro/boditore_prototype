require 'rails_helper'

describe Post do
    describe '#create' do
        it "is valid with all content of the post" do
          post = FactoryBot.create(:post)
          expect(post).to be_valid
        end
    end

  end