# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Athletes" do
    describe "Admin" do
      describe "athletes", type: :feature do
        refinery_login

        describe "athletes list" do
          before do
            FactoryBot.create(:athlete, :first_name => "UniqueTitleOne")
            FactoryBot.create(:athlete, :first_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.athletes_admin_athletes_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.athletes_admin_athletes_path

            click_link "Add New Athlete"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "First Name", :with => "This is a test of the first string field"
              expect {click_button "Save"}.to change(Refinery::Athletes::Athlete, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect {click_button "Save"}.not_to change(Refinery::Athletes::Athlete, :count)

              expect(page).to have_content("First Name can't be blank")
            end
          end

          context "duplicate" do
            before {FactoryBot.create(:athlete, :first_name => "UniqueTitle")}

            it "should fail" do
              visit refinery.athletes_admin_athletes_path

              click_link "Add New Athlete"

              fill_in "First Name", :with => "UniqueTitle"
              expect {click_button "Save"}.not_to change(Refinery::Athletes::Athlete, :count)

              expect(page).to have_content("There were problems")
            end
          end

          context "with translations" do
            before do
              Refinery::I18n.stub(:frontend_locales).and_return([:en, :cs])
            end

            describe "add a page with title for default locale" do
              before do
                visit refinery.athletes_admin_athletes_path
                click_link "Add New Athlete"
                fill_in "First Name", :with => "First column"
                click_button "Save"
              end

              it "should succeed" do
                expect(Refinery::Athletes::Athlete.count).to eq(1)
              end

              it "should show locale marker for page" do
                p = Refinery::Athletes::Athlete.last
                within "#athlete_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'EN')
                end
              end

              it "should show first_name in the admin menu" do
                p = Refinery::Athletes::Athlete.last
                within "#athlete_#{p.id}" do
                  expect(page).to have_content('First column')
                end
              end
            end

            describe "add a athlete with title for primary and secondary locale" do
              before do
                visit refinery.athletes_admin_athletes_path
                click_link "Add New Athlete"
                fill_in "First Name", :with => "First column"
                click_button "Save"

                visit refinery.athletes_admin_athletes_path
                within ".actions" do
                  click_link "Edit this athlete"
                end
                within "#switch_locale_picker" do
                  click_link "Cs"
                end
                fill_in "First Name", :with => "First translated column"
                click_button "Save"
              end

              it "should succeed" do
                expect(Refinery::Athletes::Athlete.count).to eq(1)
                expect(Refinery::Athletes::Athlete::Translation.count).to eq(2)
              end

              it "should show locale flag for page" do
                p = Refinery::Athletes::Athlete.last
                within "#athlete_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'EN')
                  expect(page).to have_css(".locale_marker", content: 'CS')
                end
              end

              it "should show first_name in backend locale in the admin menu" do
                p = Refinery::Athletes::Athlete.last
                within "#athlete_#{p.id}" do
                  expect(page).to have_content('First column')
                end
              end
            end

            describe "add a first_name with title only for secondary locale" do
              before do
                visit refinery.athletes_admin_athletes_path
                click_link "Add New Athlete"
                within "#switch_locale_picker" do
                  click_link "Cs"
                end

                fill_in "First Name", :with => "First translated column"
                click_button "Save"
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::Athletes::Athlete.last
                within "#athlete_#{p.id}" do
                  expect(page).to have_content('First translated column')
                end
              end

              it "should show locale flag for page" do
                p = Refinery::Athletes::Athlete.last
                within "#athlete_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'CS')
                end
              end
            end
          end

        end

        describe "edit" do
          before {FactoryBot.create(:athlete, :first_name => "A first_name")}

          it "should succeed" do
            visit refinery.athletes_admin_athletes_path

            within ".actions" do
              click_link "Edit this athlete"
            end

            fill_in "First Name", :with => "A different first_name"
            click_button "Save"

            expect(page).to have_content("'A different first_name' was successfully updated.")
            expect(page).not_to have_content("A first_name")
          end
        end

        describe "destroy" do
          before {FactoryBot.create(:athlete, :first_name => "UniqueTitleOne")}

          it "should succeed" do
            visit refinery.athletes_admin_athletes_path

            click_link "Remove this athlete forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Athletes::Athlete.count).to eq(0)
          end
        end

      end
    end
  end
end
