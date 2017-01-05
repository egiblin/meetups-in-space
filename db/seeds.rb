# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

Meetup.create(location: 'His Imagination',
time: '5pm',
name: 'John\'s birthday party',
duration: '4 seconds',
date: 'Who cares?',
description: 'The saddest thing in the world.')
User.create(provider: 'Comcast',
uid: '1',
username: 'dude',
email: 'dude@duder.edu',
avatar_url: '/dude.jpg')
