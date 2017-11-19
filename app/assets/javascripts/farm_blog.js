//= require froala_editor.min.js
//= require plugins/image.min.js
//= require plugins/image_manager.min.js

function PostCategorySelect(){
  // Switches between a select and input for post category
  this.select = $('#post_post_category');
  this.input = $('#post_new_post_category');
  this.toggler = $('[name=toggle_select]');

  this.toggle = function(element_to_show){
    this.current_element = element_to_show;
    if(element_to_show == this.select){
      this.toggler.text('New Category');
      this.input.hide(100);
      this.input.val(null);
      this.select.show(100);
    } else {
      this.toggler.text('Existing Category');
      this.select.hide(100);
      this.select.val(null);
      this.input.show(100);
    }
  }

  this.init = function(){
    var t = this;
    this.input.hide().removeClass('hidden');
    this.toggle(this.select);

    this.toggler.click(function(e){
      e.preventDefault();
      if(t.current_element == t.select){
        t.toggle(t.input);
      } else {
        t.toggle(t.select);
      }
    });
  }
}
