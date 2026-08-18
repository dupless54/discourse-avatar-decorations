import Component from "@glimmer/component";

export default class CosmeticFrameCard extends Component {
  get frameClass() {
    // Profil kartı açılan kullanıcının çerçeve verisini oku
    const frame = this.args.outletArgs?.user?.custom_fields?.avatar_frame; [cite: 1]
    return frame ? `frame-${frame}` : null; [cite: 2]
  }

  <template>
    {{#if this.frameClass}}
      <div class="avatar-frame-overlay {{this.frameClass}}"></div> [cite: 2]
    {{/if}}
  </template>
}