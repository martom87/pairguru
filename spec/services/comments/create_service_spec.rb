require "rails_helper"

RSpec.describe Comments::CreateService, type: :service do

  let(:params) {{'signature' => signature, 'content' => content}}
  let (:signature) {'martom'}
  let (:content) {'super film'}
  let(:user) {FactoryBot.build(:user)}
  let (:movie) {FactoryBot.build(:movie)}

  subject {described_class.new(params: params, user: user, movie: movie).call}

  context 'when the comment object is created' do

    describe 'subject' do

      it 'is expected to be class of comment' do
        expect(subject.class).to be (Comment)
      end

      it 'is expected to create comment with signature' do
        expect(subject.signature).to eq (signature)
      end

      it 'is expected to create comment with content' do
        expect(subject.content).to eq (content)
      end

    end
  end

end