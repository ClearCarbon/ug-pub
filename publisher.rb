require 'fileutils'

class Publisher

  def publish(venue)
    puts venue
    FileUtils.rm path_to_octopress_post
    File.open path_to_octopress_post, 'w' do |file|
      file.write("---\n
layout: post\n
title: 'Next Event'\n
comments: false\n
categories: \n
---\n
This Geeks in the Pub we will be at the [#{venue['name']}](#{venue['url']}) on Wednesday 3rd September starting at 18:30 until 23:00ish.\n
\n
See you all there!\n
")

      system("cd #{path_to_octopress} && bundle exec rake generate")
    end
  end

  def path_to_octopress_post
    path_to_octopress + 'source/_posts/2014-01-19-next-event.markdown'
  end

  def path_to_octopress
    '/Users/chris/projects/gitpubsheff.github.io/'
  end

end
