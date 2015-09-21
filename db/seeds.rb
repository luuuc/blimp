User.delete_all
users = User.create(
  [
    { username: 'luuuc', email: 'luc@blimp.com', password: 'blahblah' },
    { username: 'aaron', email: 'aaron@blimp.com', password: 'blahblah' },
    { username: 'benjamin', email: 'benjamin@blimp.com', password: 'blahblah' },
    { username: 'Elena', email: 'elena@blimp.com', password: 'blahblah' }
  ]
)
users.each do |u|
  rand(10..50).times do
    user = User.where("email != ?", u.email).sample
    u.messages.create(body: Faker::Lorem.sentence, user: user, type: 'Comment', created_at: Faker::Time.between(1.month.ago, DateTime.now))
  end
end

Channel.delete_all
channels = Channel.create(
  [
    { name: 'general' },
    { name: 'marketing' },
    { name: 'media' },
    { name: 'water-cooler' }
  ]
)
channels.each do |c|
  rand(10..50).times do
    c.messages.create(body: Faker::Lorem.sentence, user: users[rand(0..3)], type: 'Comment', created_at: Faker::Time.between(1.month.ago, DateTime.now))
  end
end

Group.delete_all
groups = Group.create(
  [
    { name: 'summer-campaign' },
    { name: 'marketing-stats' },
    { name: 'all-hands' }
  ]
)

GroupMember.delete_all
groups.each do |g|
  g.users << users
  rand(10..50).times do
    g.messages.create(body: Faker::Lorem.sentence, user: users[rand(0..3)], type: 'Comment', created_at: Faker::Time.between(1.month.ago, DateTime.now))
  end
end
