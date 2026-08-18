import Component from "@glimmer/component";

export default class CosmeticCardBg extends Component {
  get cardBgClass() {
    const cardBg = this.args.outletArgs?.user?.custom_fields?.user_card_decoration;
    return cardBg ? `card-effect-${cardBg}` : null;
  }

  <template>
    {{#if this.cardBgClass}}
      <!-- Ana Taşıyıcı -->
      <div class="user-card-effect-wrapper {{this.cardBgClass}}">
        <!-- 3 Sihirli Parça -->
        <div class="effect-top"></div>
        <div class="effect-sides"></div>
        <div class="effect-bottom"></div>
      </div>
    {{/if}}
  </template>
}