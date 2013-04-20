Given /^I visit the group setup wizard for that group$/ do
  visit setup_group_path(@group.id)
end

Then /^I should see the group setup wizard$/ do
  page.should have_content('Set up your group')
end

When /^I click the "(.*?)" button$/ do |id|
  find("##{id}").click
end

Then /^I should see the setup group tab$/ do
  find('.tab-content').should have_css('#group-tab.active')
end

Then /^I should see the setup discussion tab$/ do
  find('.tab-content').should have_css('#discussion-tab.active')
end

Then /^I should see the setup decision tab$/ do
  find('.tab-content').should have_css('#motion-tab.active')
end

Then /^I should see the setup invites tab$/ do
  find('.tab-content').should have_css('#invite-tab.active')
end

When /^I am on the final tab$/ do
  find('ul.nav-tabs li:last a').click()
end

Then /^the group_setup should be created$/ do
  @group_setup = GroupSetup.find_by_group_id(@group.id)
end

Then /^the group should have a discussion$/ do
  @group_setup.group.discussions.count.should == 1
end

Then /^the discussion should have a motion$/ do
  @group_setup.group.motions.count.should == 1
end

Then /^I should see the group page$/ do
  page.should have_css('.group')
end

Then /^I should see the timezone select$/ do
  page.should have_css('#group_setup_close_at_time_zone')
end

Then /^I should see the finished page$/ do
  page.should have_content('Finished!')
end

When /^I fill in the group panel$/ do
  fill_in 'Group name', with: "My group name"
  fill_in 'Group description', with: "A discription of my group"
end

When /^I fill in the discussion panel$/ do
  fill_in 'Discussion title', with: "My discussion title"
  fill_in 'Discussion description', with: "A discription of my discussion"
end

When /^I fill in the motion panel$/ do
  fill_in 'Motion title', with: "My discussion title"
  fill_in 'Motion description', with: "A discription of my discussion"
end

When /^I fill in the invites panel$/ do
  fill_in 'Members list', with: "peanut@butter.co.nz, jam@toastie.com"
end

Then /^invitations should be sent out to each recipient$/ do
  @group_setup.recipients.each do |email_address|
    open_email(email_address)
    current_email.should have_subject(@group_setup.invite_subject)
  end
end