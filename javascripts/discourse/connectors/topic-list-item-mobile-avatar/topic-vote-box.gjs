import Component from "@glimmer/component";
import routeAction from "discourse/helpers/route-action";
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
    {{/if}}
  </template>
}
