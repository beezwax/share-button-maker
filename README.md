# Share Button Maker

This is a gem to helper you quick create a share feature in you Rails apps.


# Sites list

* Facebook
* Twitter
* Douban
* Google+
* Weibo
* QZone
* Google Bookmark
* Delicious
* Tumblr
* Pinterest
* Email
* LinkedIn
* WeChat (Weixin)
* Vkontakte
* Odnoklassniki
* Xing
* Reddit
* Hacker News
* Telegram

## Screenshot

<img width="473" alt="2016-10-05 8 51 07" src="https://cloud.githubusercontent.com/assets/5518/19097657/ea7c0a20-8ad8-11e6-953f-83354d9a6384.png">

## Install

In your `Gemfile`:

```ruby
gem 'share-button-maker'
```


And install it:

```bash
$ bundle install
$ rails generate share_button_maker:install
```

## Configure

You can config `config/initializers/share_button_maker.rb` to choose which site do you want to use:

```ruby
ShareButtonMaker.configure do |config|
  config.allow_sites = %w(mail linked twitter facebook google)
end
```

## Usage

Add `require css.js` file in your app assets files:

`app/assets/javascripts/application.coffee`

```
#= require share-button-maker
#= require share-button-maker/wechat # if you need use WeChat
```

`app/assets/stylesheets/application.scss`

```
*= require share-button-maker
```

In Rails 4.1.6 , use `@import` to require files:

`app/assets/stylesheets/application.css.scss`

```
@import "share-button-maker";
```

Then you can use `social_share_button_tag` helper in views, for example `app/views/posts/show.html.erb`

```erb
<%= social_share_button_tag(@post.title) %>
```

Apart from the default title, you can specify the title for the special social network:

```erb
<%= social_share_button_tag(@post.title, 'data-twitter-title' => 'TheTitleForTwitter') %>
```

To specify sites at runtime:

```erb
<%= social_share_button_tag(@post.title, :allow_sites => %w(twitter facebook)) %>
```

And you can custom rel attribute:

```erb
<%= social_share_button_tag(@post.title, :rel => "twipsy") %>
```

You can also specify the URL that it links to:

```erb
<%= social_share_button_tag(@post.title, :url => "http://myapp.com/foo/bar") %>
```

```erb
<%= social_share_button_tag(@post.title, :url => "http://myapp.com/foo/bar", :image => "http://foo.bar/images/a.jpg", desc: "The summary of page", via: "MyTwitterName") %>
```

For the Tumblr there are an extra settings, prefixed with : `data-*`

```erb
<%= social_share_button_tag(@post.title, :image => "", :'data-type' => 'photo') %>
<%= social_share_button_tag(@post.title, :'data-source' => "", :'data-type' => 'photo') %>
```

Those two above calls are identical.
Here are the mapping of attributes depending on you data-type parameter

| data-type         | standard  | custom :"data-*" prefixed  |
| ----------------- | --------- | -------------------------- |
| link (default)    | title     | data-title                 |
|                   | url       | data-url                   |
| text              | title     | data-title                 |
| photo             | title     | data-caption               |
|                   | image     | data-source                |
| quote             | title     | data-quote                 |
|                   |           | data-source                |

## More arguments
#options:

all of the following can be passes as named parameters (options) to the second argument of `social_share_button_tag`

rel
  *TODO: document*

url
  *TODO: document*

desc
  *TODO: document*


allow_sites
  override default settings set in base calss

inner_element 
  defaults to nothing, but can be overridden for other elements. 
  pass as **element name only without <...> syntax marks**
  note *each* a tag (href) displayed will wrap a copy of this content, if passed
  use when you need an additional element as your button, like a font awesome
  <i class='fa-icon'></i>, etc. 
  leave as nothing to style fully using the native a href
  
font_awesome
  defaults to false; 
  
fa_icon_classes (ignored if font_awesome is false)
  defaults to only 'fa' any addition fa classes passed will be merged with 'fa' and appeneded
  to the icon classes. pass as string with spaces separating multiple class names
 
self_styled
  defautls to false; use social share general styling
  set to true to turn off social share's general styling completely 
  automatically set to true for you use if you use font awesome

classes 
  classes applied to inner_element 


## How to change icon size?

Yes, you can override share-button-maker base css to change the icon size.

In you `app/assets/stylesheets/application.scss`:

```scss
$size: 24px;

.social-share-button {
  .ssb-icon {
    background-size: $size $size;
    height: $size;
    width: $size;
  }
}
```

## Demo

[https://ruby-china.org/wiki/about](https://ruby-china.org/wiki/about)
