# ==============================================================================
# PROFILE
# ==============================================================================
profile = Profile.first_or_initialize
profile.update!(
  full_name: "Bùi Hoàng Thái",
  headline: "Middle Software Engineer",
  bio: "Middle Software Engineer with over 3 years of experience building scalable, data-intensive systems. " \
       "I hold a degree in Foreign Economics from Foreign Trade University, providing me with a strong foundation " \
       "in business logic that complements my technical expertise. Since the start of my professional journey, " \
       "I have been a dedicated member of Amcolab Co., Ltd, specializing in Ruby on Rails, React.js, and " \
       "AI-assisted backend services. I am passionate about designing RAG workflows and optimizing system " \
       "performance for production-ready environments.",
  availability_text: "Open for opportunities",
  cv_url: "/cv.pdf"
)

# ==============================================================================
# SOCIAL LINKS
# ==============================================================================
SocialLink.find_or_create_by!(profile: profile, platform: "GitHub") do |link|
  link.url = "https://github.com/thaibhoang"
  link.position = 1
end

SocialLink.find_or_create_by!(profile: profile, platform: "LinkedIn") do |link|
  link.url = "https://linkedin.com/in/thái-bùi-hoàng-168bb9252"
  link.position = 2
end

SocialLink.find_or_create_by!(profile: profile, platform: "Email") do |link|
  link.url = "mailto:hoangthai.ftu53@gmail.com"
  link.position = 3
end

# ==============================================================================
# EXPERIENCE
# ==============================================================================
Experience.find_or_create_by!(profile: profile, role: "Software Engineer", company: "Amcolab Co., Ltd") do |exp|
  exp.start_on = Date.new(2022, 6, 1)
  exp.end_on = nil
  exp.description = "Engineered scalable backend components and high-volume data pipelines using Ruby on Rails. " \
                    "Optimized system performance and resolved critical production bugs to ensure high uptime and stability."
  exp.position = 1
end

# ==============================================================================
# SKILLS
# ==============================================================================
{
  "Languages"                  => [ "Ruby", "JavaScript (ES6+)", "TypeScript", "SQL", "HTML/CSS" ],
  "Frameworks & Libraries"     => [ "Ruby on Rails", "React.js", "Node.js", "Next.js", "Hotwire / Turbo", "TailwindCSS", "ActionCable" ],
  "Tools & Infrastructure"     => [ "PostgreSQL", "Redis", "Sidekiq", "Docker", "Swagger", "RSpec", "Firebase", "Git", "FFmpeg", "WebSockets" ]
}.each_with_index do |(group, names), group_index|
  names.each_with_index do |name, i|
    Skill.find_or_create_by!(profile: profile, group_name: group, name: name) do |skill|
      skill.position = (group_index * 20) + i + 1
    end
  end
end

# ==============================================================================
# CATEGORIES & TAGS
# ==============================================================================
cat_rails       = Category.find_or_create_by!(slug: "rails")        { |c| c.name = "Rails" }
cat_backend     = Category.find_or_create_by!(slug: "backend")       { |c| c.name = "Backend" }
cat_ai          = Category.find_or_create_by!(slug: "ai")            { |c| c.name = "AI" }
cat_devops      = Category.find_or_create_by!(slug: "devops")        { |c| c.name = "DevOps" }
cat_system      = Category.find_or_create_by!(slug: "system-design") { |c| c.name = "System Design" }

tag_rails       = Tag.find_or_create_by!(slug: "rails")         { |t| t.name = "Rails" }
tag_react       = Tag.find_or_create_by!(slug: "react")         { |t| t.name = "React" }
tag_redis       = Tag.find_or_create_by!(slug: "redis")         { |t| t.name = "Redis" }
tag_websocket   = Tag.find_or_create_by!(slug: "websockets")    { |t| t.name = "WebSockets" }
tag_postgresql  = Tag.find_or_create_by!(slug: "postgresql")    { |t| t.name = "PostgreSQL" }
tag_sidekiq     = Tag.find_or_create_by!(slug: "sidekiq")       { |t| t.name = "Sidekiq" }
tag_ai          = Tag.find_or_create_by!(slug: "ai")            { |t| t.name = "AI" }
tag_hotwire     = Tag.find_or_create_by!(slug: "hotwire")       { |t| t.name = "Hotwire" }
tag_architecture = Tag.find_or_create_by!(slug: "architecture") { |t| t.name = "Architecture" }
tag_docker      = Tag.find_or_create_by!(slug: "docker")        { |t| t.name = "Docker" }

# ==============================================================================
# BLOG POSTS
# ==============================================================================
post1 = Post.find_or_initialize_by(slug: "building-high-concurrency-messaging-with-actioncable-and-redis")
post1.update!(
  title: "Building High-Concurrency Messaging with ActionCable and Redis",
  excerpt: "Real-world lessons from engineering a low-latency messaging engine that handles thousands of concurrent " \
           "users — using ActionCable, Redis pub/sub, and careful connection management.",
  content: <<~CONTENT,
    When we set out to build Aituber's real-time interaction platform, the primary challenge was clear: thousands of users
    simultaneously chatting, sending reactions, and watching a live stream — all requiring sub-100ms message delivery.

    ## Why ActionCable + Redis?

    Rails' ActionCable provides an abstraction over WebSockets that integrates naturally into the Rails ecosystem.
    Backed by Redis as the pub/sub adapter, it scales horizontally across multiple Puma processes and dyno instances.

    ## Key Architecture Decisions

    **1. Channel Segmentation**
    Instead of one monolithic channel, we split communication into purpose-specific channels:
    - `ChatChannel` — user messages and reactions
    - `StreamStatusChannel` — live/offline state broadcasts
    - `KaraokeChannel` — synchronized lyrics events

    This reduced noise and allowed independent scaling of each concern.

    **2. Redis Pipeline Batching**
    High-frequency events (reactions, viewer counts) were batched using Redis pipelines before broadcasting,
    cutting round-trip overhead by ~60% during peak load.

    **3. Connection Lifecycle Management**
    We implemented explicit `subscribed` / `unsubscribed` hooks to clean up Redis keys and prevent memory leaks
    in long-running sessions.

    ## Results

    - Sustained 2,000+ concurrent WebSocket connections per instance
    - Average message delivery latency: < 80ms under normal load
    - Zero dropped messages during YouTube Live integration tests
  CONTENT
  status: :published,
  published_at: 3.days.ago,
  featured: true,
  category: cat_backend
)
PostTag.find_or_create_by!(post: post1, tag: tag_rails)
PostTag.find_or_create_by!(post: post1, tag: tag_websocket)
PostTag.find_or_create_by!(post: post1, tag: tag_redis)

post2 = Post.find_or_initialize_by(slug: "designing-a-trip-matching-engine-in-rails")
post2.update!(
  title: "Designing a Trip Matching Engine in Rails",
  excerpt: "How we architected the core matching logic for a social carpool platform — covering transactional integrity, " \
           "spatial queries, and real-time confirmations with ActionCable.",
  content: <<~CONTENT,
    AINORY was a social taxi carpool matching platform where drivers post trip offers and riders join them in real time.
    The matching engine was the heart of the system — and getting it wrong meant lost trips and angry users.

    ## The Problem Space

    A match event involves multiple concurrent actors:
    - A driver broadcasting an available trip
    - Multiple riders requesting to join simultaneously
    - The system confirming one rider and notifying others

    This is a classic optimistic concurrency problem.

    ## Solution: Serialized Matching with Advisory Locks

    We used PostgreSQL advisory locks to serialize matching per trip, ensuring only one join request
    is processed at a time without blocking unrelated trips.

    ```ruby
    Trip.with_advisory_lock(trip_id) do
      trip.join_requests.pending.first.accept!
    end
    ```

    ## Real-Time Confirmations

    Once a match is confirmed, ActionCable broadcasts the result to all subscribers of that trip's channel.
    Riders see instant "Seat Taken" or "You're matched!" notifications without polling.

    ## Spatial Queries

    We used PostGIS extensions on PostgreSQL to query nearby trip offers within a configurable radius,
    avoiding full-table scans as the dataset grew.

    ## Outcome

    - Matching conflicts reduced to zero after advisory lock implementation
    - Average match confirmation time: < 200ms end-to-end
    - System handled peak-hour load without degradation
  CONTENT
  status: :published,
  published_at: 10.days.ago,
  category: cat_system
)
PostTag.find_or_create_by!(post: post2, tag: tag_rails)
PostTag.find_or_create_by!(post: post2, tag: tag_postgresql)
PostTag.find_or_create_by!(post: post2, tag: tag_architecture)

post3 = Post.find_or_initialize_by(slug: "integrating-dify-ai-into-a-rails-backend")
post3.update!(
  title: "Integrating Dify AI into a Rails Backend for Personalized Ordering",
  excerpt: "A practical walkthrough of wiring a Dify RAG workflow into a Ruby on Rails backend — " \
           "covering API design, prompt context injection, and streaming responses to the frontend.",
  content: <<~CONTENT,
    For Aiorder's personalized ordering assistant, we needed an AI layer that understood each user's
    order history and the current menu in real time. Dify's workflow engine was the right tool — but
    integrating it cleanly into Rails took some deliberate design.

    ## Dify as the AI Layer

    Dify provides a visual RAG workflow builder where you can define:
    - Knowledge bases (menu items, user preferences)
    - Retrieval strategy (semantic search, keyword, hybrid)
    - LLM prompt templates with dynamic variable injection

    Our Rails backend's job was to be the orchestration layer between the user, our database, and Dify.

    ## Context Injection Pattern

    Each API call to Dify included a context payload built from:
    - Last 10 orders for the user
    - Current table's active menu
    - Time-of-day and any active promotions

    ```ruby
    def build_dify_context(user, table)
      {
        user_order_history: user.recent_orders.map(&:to_dify_summary),
        menu_items: table.active_menu.items.map(&:to_dify_summary),
        current_time: Time.current.strftime("%H:%M")
      }
    end
    ```

    ## Streaming Responses via SSE

    To give users a ChatGPT-like experience, we streamed Dify's response chunks back to the React frontend
    using Server-Sent Events (SSE), keeping the connection open until the full response was delivered.

    ## Lessons Learned

    - Keep context payloads small — Dify's token window fills fast with large history arrays
    - Cache menu data aggressively; it changes infrequently but is queried on every request
    - Monitor Dify workflow latency independently from Rails response time
  CONTENT
  status: :published,
  published_at: 20.days.ago,
  category: cat_ai
)
PostTag.find_or_create_by!(post: post3, tag: tag_rails)
PostTag.find_or_create_by!(post: post3, tag: tag_ai)
PostTag.find_or_create_by!(post: post3, tag: tag_react)

# ==============================================================================
# PROJECTS
# ==============================================================================

# --- Project 1: Aituber ---
p_aituber = Project.find_or_initialize_by(slug: "aituber")
p_aituber.update!(
  title: "Aituber — AI Virtual Idol Interaction Platform",
  summary: "A real-time interaction platform featuring live chat, karaoke synchronization, and YouTube Live " \
           "streaming integration, built to handle thousands of concurrent users.",
  challenge: "The platform needed to sustain high-concurrency WebSocket connections for simultaneous chat, " \
             "reactions, and karaoke events while also processing and syncing audio/video streams for YouTube Live — " \
             "all with sub-100ms latency requirements.",
  solution: "Built a segmented ActionCable architecture backed by Redis pub/sub for message fan-out. " \
            "Integrated FFmpeg with a Node.js sidecar to handle real-time audio/video stream processing. " \
            "Offloaded heavy background work to Sidekiq to keep the main request cycle lean.",
  status: :published,
  featured: true,
  published_at: 10.days.ago
)

ProjectMetric.find_or_create_by!(project: p_aituber, name: "Concurrent WebSocket Connections") do |m|
  m.legacy_value  = "~200"
  m.improved_value = "2,000+"
  m.position = 1
end
ProjectMetric.find_or_create_by!(project: p_aituber, name: "Message Delivery Latency") do |m|
  m.legacy_value  = "> 500ms"
  m.improved_value = "< 80ms"
  m.position = 2
end

ProjectAchievement.find_or_create_by!(project: p_aituber, title: "Real-Time Scale") do |a|
  a.description = "Sustained 2,000+ concurrent WebSocket connections per instance with zero dropped messages."
  a.position = 1
end
ProjectAchievement.find_or_create_by!(project: p_aituber, title: "YouTube Live Integration") do |a|
  a.description = "Delivered stable live streaming with synchronized audio/video using FFmpeg + Node.js pipeline."
  a.position = 2
end
ProjectAchievement.find_or_create_by!(project: p_aituber, title: "Karaoke Sync Engine") do |a|
  a.description = "Built precise lyric synchronization broadcast via ActionCable with < 100ms drift tolerance."
  a.position = 3
end

ProjectLink.find_or_create_by!(project: p_aituber, kind: "github", label: "GitHub") do |link|
  link.url = "https://github.com/thaibhoang"
  link.position = 1
end
ProjectVisual.find_or_create_by!(project: p_aituber, image_url: "https://picsum.photos/seed/aituber/900/500") do |v|
  v.title = "Live Stream Dashboard"
  v.caption = "Real-time viewer interaction panel during a live session"
  v.position = 1
end

# --- Project 2: Aiorder ---
p_aiorder = Project.find_or_initialize_by(slug: "aiorder")
p_aiorder.update!(
  title: "Aiorder — Smart Restaurant Management System",
  summary: "An O2O ERP solution for restaurants covering reservations, order management, staff shift scheduling, " \
           "inventory tracking, and an AI-powered personalized ordering assistant.",
  challenge: "Restaurants needed a unified platform that connected front-of-house operations (reservations, orders) " \
             "with back-of-house workflows (kitchen, inventory, staff shifts) in real time, while also providing " \
             "intelligent menu recommendations based on individual user history.",
  solution: "Built a modular Rails backend integrating Dify AI for RAG-based ordering recommendations. " \
            "Used WebSockets for real-time order synchronization across kitchen, service, and management dashboards. " \
            "Designed the domain model around O2O event flows with transactional guarantees.",
  status: :published,
  featured: true,
  published_at: 5.days.ago
)

ProjectMetric.find_or_create_by!(project: p_aiorder, name: "Order Sync Latency") do |m|
  m.legacy_value  = "Manual refresh"
  m.improved_value = "< 200ms real-time"
  m.position = 1
end
ProjectMetric.find_or_create_by!(project: p_aiorder, name: "AI Recommendation Relevance") do |m|
  m.legacy_value  = "N/A (no AI)"
  m.improved_value = "Personalized per user history"
  m.position = 2
end

ProjectAchievement.find_or_create_by!(project: p_aiorder, title: "AI Ordering Assistant") do |a|
  a.description = "Integrated Dify AI with RAG workflow for personalized menu recommendations based on user history and real-time data."
  a.position = 1
end
ProjectAchievement.find_or_create_by!(project: p_aiorder, title: "Full O2O ERP Coverage") do |a|
  a.description = "Single platform managing reservations, orders, staff shifts, and inventory for restaurant operations."
  a.position = 2
end
ProjectAchievement.find_or_create_by!(project: p_aiorder, title: "Real-Time Sync") do |a|
  a.description = "WebSocket-driven order synchronization kept kitchen and service staff aligned without manual refresh."
  a.position = 3
end

ProjectLink.find_or_create_by!(project: p_aiorder, kind: "github", label: "GitHub") do |link|
  link.url = "https://github.com/thaibhoang"
  link.position = 1
end
ProjectVisual.find_or_create_by!(project: p_aiorder, image_url: "https://picsum.photos/seed/aiorder/900/500") do |v|
  v.title = "Order Management Dashboard"
  v.caption = "Real-time kitchen and service order synchronization interface"
  v.position = 1
end

# --- Project 3: AINORY ---
p_ainory = Project.find_or_initialize_by(slug: "ainory")
p_ainory.update!(
  title: "AINORY — Social Taxi Carpool Matching Platform",
  summary: "A carpool coordination platform where drivers post trip offers and riders match in real time, " \
           "with a backend engineered for high-availability and transactional integrity.",
  challenge: "Matching multiple concurrent riders to a single trip offer without race conditions, " \
             "while delivering instant status updates and maintaining spatial query performance at scale.",
  solution: "Serialized match processing using PostgreSQL advisory locks to eliminate race conditions. " \
            "Used ActionCable for instant match confirmations broadcast to all trip participants. " \
            "Leveraged PostGIS for efficient spatial proximity queries to surface relevant trip offers.",
  status: :published,
  featured: false,
  published_at: 15.days.ago
)

ProjectMetric.find_or_create_by!(project: p_ainory, name: "Matching Conflicts") do |m|
  m.legacy_value  = "Frequent race conditions"
  m.improved_value = "Zero after advisory lock"
  m.position = 1
end
ProjectMetric.find_or_create_by!(project: p_ainory, name: "Match Confirmation Time") do |m|
  m.legacy_value  = "> 1s"
  m.improved_value = "< 200ms end-to-end"
  m.position = 2
end

ProjectAchievement.find_or_create_by!(project: p_ainory, title: "Zero Match Conflicts") do |a|
  a.description = "Eliminated concurrent matching race conditions using PostgreSQL advisory locks."
  a.position = 1
end
ProjectAchievement.find_or_create_by!(project: p_ainory, title: "Real-Time Confirmations") do |a|
  a.description = "Instant match/rejection notifications delivered via ActionCable without polling."
  a.position = 2
end

ProjectLink.find_or_create_by!(project: p_ainory, kind: "github", label: "GitHub") do |link|
  link.url = "https://github.com/thaibhoang"
  link.position = 1
end
ProjectVisual.find_or_create_by!(project: p_ainory, image_url: "https://picsum.photos/seed/ainory/900/500") do |v|
  v.title = "Trip Matching Flow"
  v.caption = "Driver trip offer board with real-time rider matching status"
  v.position = 1
end

# --- Project 4: Listtool ---
p_listtool = Project.find_or_initialize_by(slug: "listtool")
p_listtool.update!(
  title: "Listtool — Automated Lead Generation & Form Submission",
  summary: "An automated outreach tool that scrapes contact information from third-party websites, " \
           "maps leads to dynamic form templates, and handles high-volume email delivery workflows.",
  challenge: "Different target websites use wildly different form structures and field naming conventions, " \
             "making it impossible to apply a one-size-fits-all form submission strategy.",
  solution: "Built a pattern-recognition engine that analyzes form fields and intelligently maps dynamic " \
            "templates to varying structures. Used Selenium for scraping and Sidekiq for async form submission " \
            "and email delivery at scale.",
  status: :published,
  featured: false,
  published_at: 20.days.ago
)

ProjectAchievement.find_or_create_by!(project: p_listtool, title: "Adaptive Form Mapper") do |a|
  a.description = "Pattern-recognition engine that maps templates to varying form field structures across hundreds of websites."
  a.position = 1
end
ProjectAchievement.find_or_create_by!(project: p_listtool, title: "High-Volume Email Pipeline") do |a|
  a.description = "Async Sidekiq workers with data validation layers ensured high delivery success rates for outreach campaigns."
  a.position = 2
end

ProjectLink.find_or_create_by!(project: p_listtool, kind: "github", label: "GitHub") do |link|
  link.url = "https://github.com/thaibhoang"
  link.position = 1
end
ProjectVisual.find_or_create_by!(project: p_listtool, image_url: "https://picsum.photos/seed/listtool/900/500") do |v|
  v.title = "Lead Management Interface"
  v.caption = "Lead pipeline with template mapping and submission tracking"
  v.position = 1
end

puts "✅ Seed complete: Profile, Skills, Social Links, Experience, Categories, Tags, Posts, Projects"

# ==============================================================================
# PROJECT TAGS
# ==============================================================================
{
  "aituber"  => [ tag_rails, tag_redis, tag_websocket, tag_sidekiq, tag_postgresql ],
  "aiorder"  => [ tag_rails, tag_react, tag_ai, tag_postgresql, tag_websocket ],
  "ainory"   => [ tag_rails, tag_postgresql, tag_redis, tag_websocket ],
  "listtool" => [ tag_rails, tag_postgresql, tag_sidekiq ]
}.each do |slug, tags|
  project = Project.find_by!(slug: slug)
  tags.each do |tag|
    ProjectTag.find_or_create_by!(project: project, tag: tag)
  end
end

puts "✅ ProjectTags seeded"
