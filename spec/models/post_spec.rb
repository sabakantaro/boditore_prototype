require 'rails_helper'

describe Post do
    describe '#create' do
        it "投稿内容が有効であること" do
          post = FactoryBot.create(:post)
          expect(post).to be_valid
        end
    end

  end
