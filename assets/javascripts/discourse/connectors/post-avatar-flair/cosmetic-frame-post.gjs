import Component from "@glimmer/component";

export default class CosmeticFramePost extends Component {
  get frameClass() {
    // Gönderiyi atan kullanıcının veritabanındaki avatar_frame değerini oku
    const frame = this.args.outletArgs?.post?.user_avatar_frame || 
                  this.args.outletArgs?.user?.custom_fields?.avatar_frame; [cite: 35, 36]
    return frame ? `frame-${frame}` : null; [cite: 36]
  }

  <template>
    {{#if this.frameClass}}
      <div class="avatar-frame-overlay {{this.frameClass}}"></div> [cite: 36]
    {{/if}}
  </template>
}