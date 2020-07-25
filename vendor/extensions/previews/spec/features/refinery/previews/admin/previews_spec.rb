# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Previews" do
    describe "Admin" do
      describe "previews", type: :feature do
        refinery_login

        describe "previews list" do
          before do
            FactoryBot.create(:preview, :title => "UniqueTitleOne")
            FactoryBot.create(:preview, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.previews_admin_previews_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.previews_admin_previews_path

            click_link "Add New Preview"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              expect {click_button "Save"}.to change(Refinery::Previews::Preview, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect {click_button "Save"}.not_to change(Refinery::Previews::Preview, :count)

              expect(page).to have_content("Title can't be blank")
            end
          end

          context "duplicate" do
            before {FactoryBot.create(:preview, :title => "UniqueTitle")}

            it "should fail" do
              visit refinery.previews_admin_previews_path

              click_link "Add New Preview"

              fill_in "Title", :with => "UniqueTitle"
              expect {click_button "Save"}.not_to change(Refinery::Previews::Preview, :count)

              expect(page).to have_content("There were problems")
            end
          end

          context "with translations" do
            before do
              Refinery::I18n.stub(:frontend_locales).and_return([:en, :cs])
            end

            describe "add a page with title for default locale" do
              before do
                visit refinery.previews_admin_previews_path
                click_link "Add New Preview"
                fill_in "Title", :with => "First column"
                click_button "Save"
              end

              it "should succeed" do
                expect(Refinery::Previews::Preview.count).to eq(1)
              end

              it "should show locale marker for page" do
                p = Refinery::Previews::Preview.last
                within "#preview_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'EN')
                end
              end

              it "should show title in the admin menu" do
                p = Refinery::Previews::Preview.last
                within "#preview_#{p.id}" do
                  expect(page).to have_content('First column')
                end
              end
            end

            describe "add a preview with title for primary and secondary locale" do
              before do
                visit refinery.previews_admin_previews_path
                click_link "Add New Preview"
                fill_in "Title", :with => "First column"
                click_button "Save"

                visit refinery.previews_admin_previews_path
                within ".actions" do
                  click_link "Edit this preview"
                end
                within "#switch_locale_picker" do
                  click_link "Cs"
                end
                fill_in "Title", :with => "First translated column"
                click_button "Save"
              end

              it "should succeed" do
                expect(Refinery::Previews::Preview.count).to eq(1)
                expect(Refinery::Previews::Preview::Translation.count).to eq(2)
              end

              it "should show locale flag for page" do
                p = Refinery::Previews::Preview.last
                within "#preview_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'EN')
                  expect(page).to have_css(".locale_marker", content: 'CS')
                end
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::Previews::Preview.last
                within "#preview_#{p.id}" do
                  expect(page).to have_content('First column')
                end
              end
            end

            describe "add a title with title only for secondary locale" do
              before do
                visit refinery.previews_admin_previews_path
                click_link "Add New Preview"
                within "#switch_locale_picker" do
                  click_link "Cs"
                end

                fill_in "Title", :with => "First translated column"
                click_button "Save"
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::Previews::Preview.last
                within "#preview_#{p.id}" do
                  expect(page).to have_content('First translated column')
                end
              end

              it "should show locale flag for page" do
                p = Refinery::Previews::Preview.last
                within "#preview_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'CS')
                end
              end
            end
          end

        end

        describe "edit" do
          before {FactoryBot.create(:preview, :title => "A title")}

          it "should succeed" do
            visit refinery.previews_admin_previews_path

            within ".actions" do
              click_link "Edit this preview"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).not_to have_content("A title")
          end
        end

        describe "destroy" do
          before {FactoryBot.create(:preview, :title => "UniqueTitleOne")}

          it "should succeed" do
            visit refinery.previews_admin_previews_path

            click_link "Remove this preview forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Previews::Preview.count).to eq(0)
          end
        end

      end
    end
  end
end
