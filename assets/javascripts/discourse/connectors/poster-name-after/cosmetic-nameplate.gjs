import Component from "@glimmer/component";

export default class CosmeticNameplate extends Component {
  get nameplateClass() {
    const nameplate = this.args.outletArgs?.post?.user_nameplate || 
                      this.args.outletArgs?.user?.custom_fields?.nameplate;
    return nameplate ? `nameplate-${nameplate}` : null;
  }

  <template>
    {{#if this.nameplateClass}}
      <div class="nameplate-overlay {{this.nameplateClass}}"></div>
    {{/if}}
  </template>
}