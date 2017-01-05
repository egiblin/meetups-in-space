require 'spec_helper'

feature 'Meetups page' do
  let! (:meetup) { Meetup.create(location: 'His Imagination',
  time: '5pm',
  name: 'John\'s birthday party',
  duration: '4 seconds',
  date: 'Who cares?',
  description: 'The saddest thing in the world.')}

    scenario "it shows all meetups" do
      visit '/meetups'

      expect(page).to have_content "John\'s birthday party"
    end
end
