require 'spec_helper'
require "cancan/matchers"

describe Ability do


  context 'Admin' do

    subject { ability }
    let(:admin_user) { FactoryGirl.create :admin_user }
    let(:ability) { Ability.new(admin_user) }

    it 'can manage Links.' do
      should be_able_to(:manage, Link.new)

    end
  end


  context 'User' do

    subject { ability }
    let(:user) { FactoryGirl.create :usr_user }
    let(:ability) { Ability.new(user) }
    let(:user_link) {
      FactoryGirl.create(:link) do |link|
        link.user=user
      end
    }

    it 'can create new Link .' do
      should be_able_to(:create, user_link)
    end

    it 'can read own link.' do
      should be_able_to(:read, user_link)
    end

    it 'can delete  Link .' do
      should be_able_to(:destroy, user_link)
    end

    it 'can redirect own link.' do
      should be_able_to(:redirect, user_link)
    end

    it 'can redirect others link.' do
      should be_able_to(:redirect, FactoryGirl.create(:link))
    end

    it 'can\'t edit own Link .' do
      should_not be_able_to(:update, user_link)
    end

    it 'can\'t show others  Links .' do
      should_not be_able_to(:read, FactoryGirl.create(:link))
    end
  end


  context 'Guest' do

    subject { ability }
    let(:user) { FactoryGirl.create :guest_user }
    let(:ability) { Ability.new(user) }
    let(:link) { FactoryGirl.create(:link) }


    it 'can create new Link .' do
      should be_able_to(:create, link)
    end

    it 'can redirect others link.' do
      should be_able_to(:redirect, link)
    end

    it 'can\'t read others link.' do
      should_not be_able_to(:read, link)
    end

    it 'can\'t edit others link.' do
      should_not be_able_to(:update, link)
    end

    it 'can\'t delete others link.' do
      should_not be_able_to(:destroy, link)
    end

  end
end


# describe = Given <some initial context (the givens)>,
# context = When <an event occurs>,
# it = Then <ensure some outcomes>.

# Given Ability,
# When User is admin,
# Then User can manage everything.