# README

## Code The Dream Rails Lesson 3.1

This repository contains the framework for the blog application you will develop as you go through the Treehouse videos on Rails development. You should create a Git branch called `blog` and make your changes to that branch. You should add and commit your changes periodically, and you should push them to GitHub periodically as well. Then, on completion of the Treehouse Rails videos, once you have made all the changes to your version of the blog application that the instructor in the videos has made, you can submit a pull request for review.

After you clone your assignment repository, be sure to run `bundle install`. That will be necessary for subsequent Rails assignments as well.

As you watch the videos, be sure you make all the changes that the instructor is making to his version of the application. Otherwise you won't remember the video content. At several times during the videos, the instructor shows alternate ways of doing things. You should comment out what you have instead of erasing it, so that you have a record of each way to implement a particular function.

Because the Treehouse videos use an old version of Rails, there are differences between the code in the videos and the code that you will be working with. Some of these differences are large enough that you will need to do the following as you are watching them:

* In the "Our First Resource" video of the "Ruby on Rails 5 Basics" section, immediately _after_ you enter the command:

  ```bash
  $ bin/rails generate scaffold Post title:string
  ```

  You must then also enter the following command:

  ```bash
  $ cp rails5/* app/views/posts
  ```

  Otherwise, it will be more difficult to follow along their videos later. If the command comes back with the error `cp: app/views/posts is not a directory`, then that means the `scaffold` command failed or was not yet run.
* In the "Finding a Page" video of the "Rails Routes and Resources" section, after the instructor types in `render text` in the `show` method, you must instead type `render plain`. Otherwise, you will get a "Missing template" error.
* At the end of the "Route to Create Pages" video of the "Rails Routes and Resources" section, do not be alarmed if you're unable to cause the error "The action 'create' could not be found for PagesController"; Rails 7 simply hides this under the hood and resets the form, so ignore this and continue to the next video.
* In the "Controller Action to Create Pages" video of the "Rails Routes and Resources" section, at the parts where the instructor enters `render text: params.to_json` into the `create` method or modifies the value after `text:`, skip doing this on your machine, and keep following along the video as if what appears in the instructor's browser appeared on yours. Rails 7 handles form submissions differently, so you won't be able to see the plain text responses without browser tools.
  * If you are familiar with using browser tools to inspect asynchronous requests, you may choose to replace `render text` with `render plain` (just like you did in the "Finding a Page" section) and inspect the plain text response in the Network tab.
* At the end of the "An Edit Form" video of the "Rails Routes and Resources" section, Rails 7 is again hiding the error and resetting the form. Continue to the next video.
* In the "Deleting Pages" video of the "Rails Routes and Resources" section, when you add the Delete link to the `show` view, paste this in instead:

  ```erb
  <%= link_to 'Delete', @page, data: { turbo_method: :delete, turbo_confirm: "Are you sure?" } %>
  ```

When you complete Rails Routes and Resources, push your `blog` branch to GitHub, create a pull request, and link it on the assignment submission form that's found on the class page.

## Code The Dream Rails Lesson 3.2

For assignment 3.2, you will continue work with this same repository. While the blog branch is active, create a new branch called associations.  This involves work to be added to the work in the blog branch.  You will use the same repository, but the new associations branch, to complete the work in the video called Active Record Associations in Rails.

As with the previous lesson, there are some differences in the Treehouse videos that you will have to look out for:

* In the "Has Many Associations" video, there is no error when you first enter `post.comments` in the Rails console. Just ignore this and continue.
* At the beginning of the "Belongs to Associations" video, entering `comment = Comment.last` alone does not display the comment's attributes, so you will have to enter `comment` as an additional command in order to see its `post_id`.
* In the "Active Record Associations in Rails" video, after you run the command:

  ```bash
  $ bin/rails generate migration AddPostToComments post:references
  ```

  If you run `bin/rails db:migrate` while there are still comments in the database, the migration will fail with output that starts similarly to:

  ```
  == 20240503123456 AddPostToComments: migrating ================================
  -- add_reference(:comments, :post, {:null=>false, :foreign_key=>true})
  rails aborted!
  StandardError: An error has occurred, this and all later migrations canceled:

  SQLite3::ConstraintException: NOT NULL constraint failed: comments.post_id
  /Users/student/repos/R7-blog/db/migrate/20240503123456_add_post_to_comments.rb:3:in `change'
  ```

  This is because Rails 7's `references` migrations are stricter by default and include `null: false` on foreign key columns. In our case, when the database attempts to adds the `post_id` column to the `comments` table, it does not know what `post_id` value to give to existing comments in the table, and because the value cannot be `null`, it results in an error.

  While it is possible to roll back, delete the `null: false` from the migration and re-run `db:migrate`, we recommend that you instead go into the Rails console and enter `Comment.destroy_all` because it is generally better to avoid nullable foreign key columns if possible.
* Later in the same video, when you run the command:

  ```bash
  $ bin/rails g model Comment content:text name:string post:references
  ```

  Rails 7 will not ask whether to overwrite anything; you must instead add the `--force` flag to the end of the command.
* In the "Updating an Associated Record" video, when the instructor submits the comment edit form and sees the message "The action 'update' could not be found for CommentsController", Rails 7 is again hiding the error and resetting the form, like you have already seen in the previous week. Just continue with the video.
* In the "Deleting an Associated Record" video, when you add the Delete link to the `show` view, paste this in instead:

  ```erb
  <%= link_to "Delete", [@post, comment], data: { 'turbo-method': :delete } %>
  ```

  Like in the previous video, you will not see an error message when you click the Delete link immediately after adding it to the view, so continue with the video.

You are done with it when you have completed that last video. The Active Record Associations in Rails video also involves several other Rails applications, and there are separate assignments and git repositories for those.  They are the community, periodical, and mdb repositories.  You should submit one assignment with links to all four pull requests.







Back in views/posts/show.html.erb, we can call render with a partial: argument to render the partial:

  <% @post.comments.each do |comment| %>
    <%= render partial: "comments/comment", locals: {comment: comment} %>
  <% end %>
render will look in the posts/ by default, so we need to add comments/ on front of partial name
We leave underscore out of file name in partial: argument, .html.erb is added automatically
locals: argument takes a hash with the names and values of local variables to set when rendering partial
There's a simpler way to do the same thing: we can loop through a collection and render a partial for each using render's collection: argument:

  <%= render partial: "comments/comment", collection: @post.comments, as: :comment %>
as: argument takes symbol with name of local variable to assign
The collection: argument automatically assigns current member to local variable with same name as the partial, so we can remove as: :comment:

  <%= render partial: "comments/comment", collection: @post.comments %>
And here's the ultimate shortcut... we can pass just @post.comments to render.

  <%= render @post.comments %>
render realizes you're passing it a collection, so it's as if you're passing it as the collection: argument.
Also no need for a partial: argument. render sees Comment objects in the collection, so it looks in the views/comments folder for a partial named _comment.


code for deleting from video  <%= link_to "Delete", [@post, comment], method: :delete %>


There are more useful methods you can call on an association. We'd like to show you a few of these now.

Suppose we have a new Post that doesn't have any Comments yet. We can use the present? and empty? methods to check whether comments are present:

post = Post.create(title: "Newest post")
Post.last.comments
Post.last.comments.empty? # => true
Post.last.comments.present? # => false
Any method we can use in the Rails console can be used in a controller or view as well. The empty? or present? methods can be used to change what your view renders when a collection is empty.

Only rendering <h1>Comments</h1> if comments present
views/posts/show.html.erb

  <% if @post.comments.present? %>
    <h1>Comments</h1>
    <%= render @post.comments %>
  <% end %>
The size method lets you check the number of records in a collection.

2.3.0 :001 > Post.first.comments
 => #<ActiveRecord::Associations::CollectionProxy [#<Comment id: 1, content: "Hi", name: "Alena", post_id: 1, created_at: "2017-10-02 01:01:33", updated_at: "2017-10-02 01:01:33">, #<Comment id: 2, content: "Nice post!", name: "Jay", post_id: 1, created_at: "2017-10-02 21:50:17", updated_at: "2017-10-02 21:50:17">, #<Comment id: 3, content: "Cool!", name: "Pasan", post_id: 1, created_at: "2017-10-02 21:50:34", updated_at: "2017-10-02 21:50:34">]>
2.3.0 :003 > Post.first.comments.size
 => 3
Active Record adds a where method to associations that allows you to further filter the set of results. For example, we've got comments on the first post from several different authors. If I wanted to limit that to comments where the name field was "Alena", I could write Post.first.comments.where(name: "Alena"):

2.3.0 :004 > Post.first.comments.where(name: "Alena")
 => #<ActiveRecord::AssociationRelation [#<Comment id: 1, content: "Hi", name: "Alena", post_id: 1, created_at: "2017-10-02 01:01:33", updated_at: "2017-10-02 01:01:33">]>