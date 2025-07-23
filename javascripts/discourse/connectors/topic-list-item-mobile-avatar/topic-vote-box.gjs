import Component from "@glimmer/component";
import UserLink from "discourse/components/user-link";
import avatar from "discourse/helpers/avatar";
import routeAction from "discourse/helpers/route-action";
import { i18n } from "discourse-i18n";
import VoteBox from "discourse/plugins/discourse-topic-voting/discourse/components/vote-box";

export default class TopicVoteBox extends Component {
  get renderVoteBox() {
    return this.args.topic.can_vote;
  }

  get topic() {
    return this.args.topic;
  }

  <template>
    {{#if this.renderVoteBox}}
      <div class="topic-list-vote-box">
        <VoteBox @topic={{this.topic}} @showLogin={{routeAction "showLogin"}} />
      </div>
    {{else}}
      <UserLink
        @ariaLabel={{i18n
          "latest_poster_link"
          username=@topic.lastPosterUser.username
        }}
        @username={{@topic.lastPosterUser.username}}
      >
        {{avatar @topic.lastPosterUser imageSize="large"}}</UserLink>
    {{/if}}
  </template>
}
