import Component from "@glimmer/component";

export default class CosmeticFrameProfile extends Component {
  get frameClass() {
    // Ana profil sayfasındaki modelden çerçeve verisini oku
    const frame = this.args.outletArgs?.model?.custom_fields?.avatar_frame; [cite: 33]
    return frame ? `frame-${frame}` : null; [cite: 34]
  }

  <template>
    {{#if this.frameClass}}
      <div class="avatar-frame-overlay {{this.frameClass}}"></div> [cite: 34]
    {{/if}}
  </template>
}