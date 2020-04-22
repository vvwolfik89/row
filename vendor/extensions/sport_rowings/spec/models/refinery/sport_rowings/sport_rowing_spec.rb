require 'spec_helper'

module Refinery
  module SportRowings
    describe SportRowing do
      describe "validations", type: :model do
        subject do
          FactoryBot.create(:sport_rowing,
                            :title => "Refinery CMS")
        end

        it {should be_valid}
        its(:errors) {should be_empty}
        its(:title) {should == "Refinery CMS"}
      end
    end
  end
end
