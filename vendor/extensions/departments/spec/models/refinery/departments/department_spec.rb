require 'spec_helper'

module Refinery
  module Departments
    describe Department do
      describe "validations", type: :model do
        subject do
          FactoryBot.create(:department,
                            :title => "Refinery CMS")
        end

        it {should be_valid}
        its(:errors) {should be_empty}
        its(:title) {should == "Refinery CMS"}
      end
    end
  end
end
