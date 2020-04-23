require 'spec_helper'

module Refinery
  module Coaches
    describe Coach do
      describe "validations", type: :model do
        subject do
          FactoryBot.create(:coach,
                            :first_name => "Refinery CMS")
        end

        it {should be_valid}
        its(:errors) {should be_empty}
        its(:first_name) {should == "Refinery CMS"}
      end
    end
  end
end
