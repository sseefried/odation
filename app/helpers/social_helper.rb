module SocialHelper

  # SOCIAL MEDIA TOOLBAR HELPERS

def social_helpers(id, title, body, type = "button")
      if (type == "button")
    html = ""
    html = <<HTML
      <div class="social_header"><div id="fb-root"></div><fb:like href="http://odation.com/posts/#{id}" send="true"  layout="button_count" width="450" show_faces="false" font=""></fb:like><a href="http://twitter.com/share" class="twitter-share-button" data-count="horizontal" data-via="odation">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script><a href=" ">Send Email</a></div>
HTML
    html.html_safe                   

      else                           

    html = ""
    html = <<HTML
       <div class="teaser_social_helper"><div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=202341553141662&amp;xfbml=1"></script><fb:like href="http://odation.com/posts/#{id}" send="false" layout="box_count" width="450" show_faces="false" font=""></fb:like>
       <a href="http://twitter.com/share" class="twitter-share-button" data-count="vertical" data-via="odation">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>    </div>
HTML
    html.html_safe  
      end

    end 

    def fb_meta(fb_title, fb_type, fb_url, fb_image, fb_sitename, fb_description)

    html = ""
    html = <<HTML
  <meta property="og:title" content="Odation Protocol Please"/>
  <meta property="og:type" content="city "/>
  <meta property="og:url" content="http://odation.com/stay/index"/>
  <meta property="og:image" content="http://ia.media-imdb.com/rock.jpg"/>
  <meta property="og:site_name" content="IMDb"/>
  <meta property="og:description"
            content="A group of U.S. Marines, under command of
                     a renegade general, take over Alcatraz and
                     threaten San Francisco Bay with biological
                     weapons."/>

HTML
    end
  
end