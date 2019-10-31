require "rails_helper"


RSpec.describe Comment, type: :model do

  describe 'database columns' do
    it {is_expected.to have_db_column :signature}
    it {is_expected.to have_db_column :content}
    it {is_expected.to have_db_column :user_id}
    it {is_expected.to have_db_column :movie_id}
  end

  describe 'associations' do
    it {should belong_to(:user)}
    it {should belong_to(:movie)}
  end

  describe 'validations' do
    it {should validate_presence_of(:signature)}
    it {should validate_presence_of(:content)}
    it {should validate_uniqueness_of(:user_id).scoped_to(:movie_id).with_message('You have already commented on this movie.')}
  end

end
