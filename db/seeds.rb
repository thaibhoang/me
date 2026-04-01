rails = Category.find_or_create_by!(slug: "rails") { |c| c.name = "Rails" }
architecture = Category.find_or_create_by!(slug: "architecture") { |c| c.name = "Architecture" }

hotwire = Tag.find_or_create_by!(slug: "hotwire") { |t| t.name = "Hotwire" }
aws = Tag.find_or_create_by!(slug: "aws") { |t| t.name = "AWS" }

post = Post.find_or_initialize_by(slug: "rails-8-mvp-playbook")
post.update!(
  title: "Rails 8 MVP Playbook",
  excerpt: "Cach toi build MVP nhanh voi Rails 8, SSR va Hotwire.",
  content: "Noi dung demo cho bai viet.",
  status: :published,
  published_at: Time.current,
  featured: true,
  category: rails
)
PostTag.find_or_create_by!(post: post, tag: hotwire)

post2 = Post.find_or_initialize_by(slug: "designing-scalable-architecture")
post2.update!(
  title: "Designing Scalable Architecture",
  excerpt: "Nguyen tac can biet de he thong scale on dinh.",
  content: "Noi dung demo cho bai viet thu 2.",
  status: :published,
  published_at: 1.day.ago,
  category: architecture
)
PostTag.find_or_create_by!(post: post2, tag: aws)

project = Project.find_or_initialize_by(slug: "platform-migration")
project.update!(
  title: "Platform Migration",
  summary: "Di chuyen he thong len cloud, giam 40% chi phi.",
  challenge: "He thong cu kho scale.",
  solution: "Refactor + migration theo tung phase.",
  status: :published,
  featured: true,
  published_at: Time.current
)

ProjectLink.find_or_create_by!(project: project, kind: "demo", label: "Live Demo") do |link|
  link.url = "https://example.com/demo"
  link.position = 1
end
ProjectVisual.find_or_create_by!(project: project, image_url: "https://picsum.photos/900/500") do |visual|
  visual.title = "Dashboard"
  visual.caption = "Giao dien dashboard sau migration"
  visual.position = 1
end

profile = Profile.first_or_initialize
profile.update!(
  full_name: "The Architect",
  headline: "Senior Software Engineer",
  bio: "Xay dung san pham, he thong va quy trinh ben vung.",
  availability_text: "Open for opportunities",
  cv_url: "https://example.com/cv.pdf"
)

Experience.find_or_create_by!(profile: profile, role: "Senior Engineer", company: "Acme Corp") do |experience|
  experience.start_on = Date.new(2022, 1, 1)
  experience.position = 1
end

Skill.find_or_create_by!(profile: profile, group_name: "Backend", name: "Rails") do |skill|
  skill.position = 1
end

SocialLink.find_or_create_by!(profile: profile, platform: "GitHub") do |link|
  link.url = "https://github.com/example"
  link.position = 1
end
