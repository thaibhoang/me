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
tag_go          = Tag.find_or_create_by!(slug: "go")            { |t| t.name = "Go" }
tag_postgis     = Tag.find_or_create_by!(slug: "postgis")       { |t| t.name = "PostGIS" }

# ==============================================================================
# BLOG POSTS
# ==============================================================================
post1 = Post.find_or_initialize_by(slug: "building-high-concurrency-messaging-with-actioncable-and-redis")
post1.update!(
  title: "Building High-Concurrency Messaging with ActionCable and Redis",
  excerpt: "Real-world lessons from engineering a low-latency messaging engine that handles thousands of concurrent " \
           "users — using ActionCable, Redis pub/sub, and careful connection management.",
  content: <<~CONTENT,
    When we set out to build Aituber's real-time interaction platform, the primary challenge was clear: thousands of users simultaneously chatting, sending reactions, and watching a live stream — all requiring sub-100ms message delivery.

    Why ActionCable and Redis

    Rails' ActionCable provides an abstraction over WebSockets that integrates naturally into the Rails ecosystem. Backed by Redis as the pub/sub adapter, it scales horizontally across multiple Puma processes and dyno instances.

    Key Architecture Decisions

    The first decision was channel segmentation. Instead of one monolithic channel, we split communication into purpose-specific channels: ChatChannel for user messages and reactions, StreamStatusChannel for live/offline state broadcasts, and KaraokeChannel for synchronized lyrics events. This reduced noise and allowed independent scaling of each concern.

    The second decision was Redis pipeline batching. High-frequency events such as reactions and viewer counts were batched using Redis pipelines before broadcasting, cutting round-trip overhead by roughly 60% during peak load.

    The third decision was connection lifecycle management. We implemented explicit subscribed and unsubscribed hooks to clean up Redis keys and prevent memory leaks in long-running sessions.

    Results

    Sustained 2,000+ concurrent WebSocket connections per instance. Average message delivery latency under 80ms under normal load. Zero dropped messages during YouTube Live integration tests.
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
    AINORY was a social taxi carpool matching platform where drivers post trip offers and riders join them in real time. The matching engine was the heart of the system — and getting it wrong meant lost trips and angry users.

    The Problem Space

    A match event involves multiple concurrent actors: a driver broadcasting an available trip, multiple riders requesting to join simultaneously, and the system confirming one rider and notifying others. This is a classic optimistic concurrency problem.

    Solution: Serialized Matching with Advisory Locks

    We used PostgreSQL advisory locks to serialize matching per trip, ensuring only one join request is processed at a time without blocking unrelated trips. The lock is scoped to the trip ID, so parallel requests for different trips proceed independently.

    Real-Time Confirmations

    Once a match is confirmed, ActionCable broadcasts the result to all subscribers of that trip's channel. Riders see instant "Seat Taken" or "You're matched!" notifications without polling.

    Spatial Queries

    We used PostGIS extensions on PostgreSQL to query nearby trip offers within a configurable radius, avoiding full-table scans as the dataset grew.

    Outcome

    Matching conflicts reduced to zero after advisory lock implementation. Average match confirmation time under 200ms end-to-end. System handled peak-hour load without degradation.
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
    For Aiorder's personalized ordering assistant, we needed an AI layer that understood each user's order history and the current menu in real time. Dify's workflow engine was the right tool — but integrating it cleanly into Rails took some deliberate design.

    Dify as the AI Layer

    Dify provides a visual RAG workflow builder where you can define knowledge bases for menu items and user preferences, a retrieval strategy covering semantic search, keyword, and hybrid modes, and LLM prompt templates with dynamic variable injection. Our Rails backend's job was to be the orchestration layer between the user, our database, and Dify.

    Context Injection Pattern

    Each API call to Dify included a context payload built from the user's last 10 orders, the current table's active menu, and the time of day along with any active promotions. Keeping this payload lean was important — Dify's token window fills fast with large history arrays.

    Streaming Responses via SSE

    To give users a ChatGPT-like experience, we streamed Dify's response chunks back to the React frontend using Server-Sent Events, keeping the connection open until the full response was delivered.

    Lessons Learned

    Keep context payloads small. Cache menu data aggressively since it changes infrequently but is queried on every request. Monitor Dify workflow latency independently from Rails response time to isolate bottlenecks.
  CONTENT
  status: :published,
  published_at: 20.days.ago,
  category: cat_ai
)
PostTag.find_or_create_by!(post: post3, tag: tag_rails)
PostTag.find_or_create_by!(post: post3, tag: tag_ai)
PostTag.find_or_create_by!(post: post3, tag: tag_react)

post4 = Post.find_or_initialize_by(slug: "building-an-llm-extraction-pipeline-for-vietnamese-sports-listings")
post4.update!(
  title: "Building an LLM Extraction Pipeline for Vietnamese Sports Listings",
  excerpt: "How I built a Go + LLM pipeline that reads raw Vietnamese Facebook posts about " \
           "badminton and pickleball meetups, extracts structured data, geocodes addresses in " \
           "Ho Chi Minh City, and feeds it into a Rails app — end to end in under 2 seconds per listing.",
  content: <<~CONTENT,
    SportyMatchy is a side project I built solo over one month: a map-based platform where badminton and pickleball players in Ho Chi Minh City can find teammates and join games. The manual posting flow was straightforward Rails. The hard part was the other data source — scraping raw text from Vietnamese Facebook groups and turning it into structured, geocoded listings automatically.

    A typical post looks like this: "Can 2 nam vang lai san 583 Nguyen Trai, 19h-21h toi nay, trinh trung binh yeu, phi 50k". No JSON. No standard format. Vietnamese slang, relative time references, and a short address that Google Maps may or may not resolve correctly.
    The Schema Contract

    Before writing a single line of Go or prompting the LLM, I defined a strict JSON Schema: listing_extraction.schema.json. This schema describes every field the LLM must produce — sport, title, start_at in ISO 8601 UTC, skill level range, slots needed, price estimate, location name, and contact info — with types, enums, and required constraints.

    The schema contract meant the LLM had one job: produce valid JSON matching this shape. Nothing else. No prose, no explanation. Just the object. This discipline paid off immediately: failures were binary. Either Go's JSON schema validator accepted the output, or it didn't. No ambiguous partial parses.

    Prompt Design: The Hard Parts

    Two things made prompt engineering genuinely difficult for this domain.

    The first was skill level taxonomy. Vietnamese players use a rich, informal spectrum to describe ability: yeu, trung binh yeu, trung binh, trung binh kha, kha, ban chuyen, chuyen nghiep — and several in-between variants. These are not synonyms; they represent distinct rungs on a ladder the local community understands intuitively. I had to enumerate all variants in the system prompt and map them to DB slugs explicitly. Early iterations without this caused the LLM to collapse the entire range into just "trung_binh".

    The second was relative time resolution. Posts say "toi nay" (tonight), "CN tuan sau" (next Sunday), or just "19h-21h". The LLM needs a reference date anchored to the Asia/Ho_Chi_Minh timezone to resolve these correctly before converting to UTC for storage. I inject the current local date and time into every user message so the model has a stable anchor. Without it, "toi nay" was being resolved to whatever the model's training data implied — completely wrong.

    Validation in Go

    The Go scraper uses a JSON schema validation library to check the LLM's response before doing anything else with it. If validation fails — hallucinated fields, wrong enum value, missing required key — the message goes to a dead-letter channel for logging and limited retry. Nothing partial ever reaches Rails.

    This boundary was one of the best architectural decisions in the whole project. It kept the Rails ingest endpoint clean — it could trust the payload shape completely.

    Geocoding: Cache-First with PostGIS

    Short Vietnamese addresses are notoriously ambiguous. "583 Nguyen Trai" could be in Quan 1 or Quan 5. Repeated geocoding API calls for the same address are wasteful and expensive.

    I built a geocoding_cache table in PostgreSQL keyed on the normalized location query string. Before calling Google Geocoding API, Rails checks this table. On a miss, it calls Google, stores the result as a geography point, and returns it. Cache hit rate in practice: over 80% after the first week, since many posts reference the same popular courts repeatedly.

    Idempotency via source_url

    Facebook post URLs are stable. Every scraped listing carries its source_url. A unique constraint on that column means re-running the scraper on the same post is a no-op — Rails returns the existing record. No duplicates accumulate even if the scraper processes the same group multiple times.

    The ingest endpoint itself is HMAC-signed using a shared secret between Go and Rails. No authentication token to manage, no OAuth dance — just a signed request header that Rails verifies before processing.

    Lessons From One Month of Building This

    Prompt iteration is the real cost. Infrastructure takes hours to set up. Getting the LLM to reliably output the right skill level slug for every Vietnamese variant took days of examples and edge-case testing. Budget more time here than you think.

    Vietnamese address geocoding has a ceiling. Some posts describe locations vaguely enough that even Google returns a district-level result, not a specific point. I accepted this: listings with a low-confidence coordinate get a nullable point and are hidden from the map feed until a background job retries with a better query.

    Go and Rails as a pipeline pair works well. Go handles the concurrency, HTTP fetching, and strict validation cleanly. Rails owns the domain model, geocoding cache, and serving. The HMAC boundary between them is thin and auditable. I would not reach for a message queue for a project at this scale — a direct signed POST is simpler and easier to debug.
  CONTENT
  status: :published,
  published_at: 14.days.ago,
  featured: true,
  category: cat_system
)
PostTag.find_or_create_by!(post: post4, tag: tag_go)
PostTag.find_or_create_by!(post: post4, tag: tag_rails)
PostTag.find_or_create_by!(post: post4, tag: tag_postgresql)
PostTag.find_or_create_by!(post: post4, tag: tag_architecture)
PostTag.find_or_create_by!(post: post4, tag: tag_postgis)

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

# --- Project 5: SportyMatchy ---
p_sportymatchy = Project.find_or_initialize_by(slug: "sportymatchy")
p_sportymatchy.update!(
  title: "SportyMatchy — Find Your Sports Partner in Ho Chi Minh City",
  summary: "A geo-aware listing platform for badminton and pickleball players to find teammates " \
           "and join games — featuring a hybrid data pipeline (manual posts + LLM-extracted from " \
           "Vietnamese social posts), PostGIS spatial search, and a React map interface. " \
           "Built solo in one month.",
  challenge: "Building a multi-service pipeline in Go + Rails that reliably extracts structured " \
             "match listings from unstructured Vietnamese social media text, geocodes short Vietnamese " \
             "addresses to GPS coordinates, and serves them on a real-time map — all within a solo " \
             "1-month build with no prior Go production experience.",
  solution: "Designed a Go scraper that feeds raw Facebook post text to an LLM constrained to a " \
            "strict JSON schema; validated every output in Go before HMAC-signed ingest to Rails. " \
            "Used PostGIS `geography(Point,4326)` with a geocoding cache table to make radius queries " \
            "fast and API costs predictable. Built the map UI as a React island mounted inside the " \
            "Rails layout (esbuild + jsbundling-rails) with Google Maps clustering by sport.",
  status: :published,
  featured: true,
  published_at: 30.days.ago
)

ProjectMetric.find_or_create_by!(project: p_sportymatchy, name: "Listing Ingestion") do |m|
  m.legacy_value   = "Manual only"
  m.improved_value = "Automated Go + LLM pipeline + manual hybrid"
  m.position = 1
end
ProjectMetric.find_or_create_by!(project: p_sportymatchy, name: "Geocoding Cost") do |m|
  m.legacy_value   = "1 API call per listing"
  m.improved_value = ">80% cache hit after week 1"
  m.position = 2
end
ProjectMetric.find_or_create_by!(project: p_sportymatchy, name: "Map Query") do |m|
  m.legacy_value   = "N/A"
  m.improved_value = "PostGIS ST_DWithin radius search"
  m.position = 3
end

ProjectAchievement.find_or_create_by!(project: p_sportymatchy, title: "LLM Extraction Pipeline") do |a|
  a.description = "Go service converts raw Vietnamese Facebook posts to validated structured JSON " \
                  "using an LLM constrained to a strict schema — including skill level slug mapping " \
                  "and timezone-aware UTC time resolution."
  a.position = 1
end
ProjectAchievement.find_or_create_by!(project: p_sportymatchy, title: "PostGIS Spatial Search") do |a|
  a.description = "Radius-based listing discovery using geography(Point,4326) and a GIST index — " \
                  "players find games within X metres of their location in a single SQL query."
  a.position = 2
end
ProjectAchievement.find_or_create_by!(project: p_sportymatchy, title: "HMAC-Secured Ingest") do |a|
  a.description = "Cryptographically signed ingest endpoint (shared HMAC secret) ensures only the " \
                  "trusted Go scraper can push listings into Rails — no public API key to rotate."
  a.position = 3
end
ProjectAchievement.find_or_create_by!(project: p_sportymatchy, title: "Geocoding Cache") do |a|
  a.description = "PostGIS-backed geocoding cache eliminates redundant Google API calls for popular " \
                  "courts — the same court address is geocoded once and reused across all future listings."
  a.position = 4
end

ProjectLink.find_or_create_by!(project: p_sportymatchy, kind: "github", label: "GitHub") do |link|
  link.url = "https://github.com/thaibhoang/giao-luu"
  link.position = 1
end

ProjectVisual.find_or_create_by!(project: p_sportymatchy, image_url: "https://picsum.photos/seed/sportymatchy-map/900/500") do |v|
  v.title = "Live Map View"
  v.caption = "Badminton and pickleball listings clustered on Ho Chi Minh City map with sport-specific icons"
  v.position = 1
end
ProjectVisual.find_or_create_by!(project: p_sportymatchy, image_url: "https://picsum.photos/seed/sportymatchy-pipeline/900/500") do |v|
  v.title = "Extraction Pipeline"
  v.caption = "Go scraper → LLM → JSON schema validation → HMAC ingest → Rails → PostGIS"
  v.position = 2
end

puts "✅ Seed complete: Profile, Skills, Social Links, Experience, Categories, Tags, Posts, Projects"

# ==============================================================================
# PROJECT TAGS
# ==============================================================================
{
  "aituber"     => [ tag_rails, tag_redis, tag_websocket, tag_sidekiq, tag_postgresql ],
  "aiorder"     => [ tag_rails, tag_react, tag_ai, tag_postgresql, tag_websocket ],
  "ainory"      => [ tag_rails, tag_postgresql, tag_redis, tag_websocket ],
  "listtool"    => [ tag_rails, tag_postgresql, tag_sidekiq ],
  "sportymatchy"  => [ tag_rails, tag_go, tag_postgis, tag_postgresql, tag_docker, tag_architecture ]
}.each do |slug, tags|
  project = Project.find_by!(slug: slug)
  tags.each do |tag|
    ProjectTag.find_or_create_by!(project: project, tag: tag)
  end
end

puts "✅ ProjectTags seeded"
