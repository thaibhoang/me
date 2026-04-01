xml.instruct! :xml, version: "1.0"
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc root_url
  end

  xml.url do
    xml.loc blog_index_url
  end

  xml.url do
    xml.loc projects_index_url
  end

  xml.url do
    xml.loc about_url
  end

  xml.url do
    xml.loc contact_url
  end

  @posts.each do |post|
    xml.url do
      xml.loc blog_post_url(post.slug)
      xml.lastmod(post.updated_at.to_date.iso8601)
    end
  end

  @projects.each do |project|
    xml.url do
      xml.loc project_url(project.slug)
      xml.lastmod(project.updated_at.to_date.iso8601)
    end
  end
end
