import 'package:ccgithubclientflutter/common/string_utils.dart';
import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/pl/model/Event.dart';
import 'package:ccgithubclientflutter/pl/model/PushEventCommit.dart';
import 'package:ccgithubclientflutter/ui/widget/gsy_user_icon_widget.dart';
import 'package:flutter/material.dart';

class UserEventItem extends StatelessWidget {
  final EventViewModel _eventViewModel;

  UserEventItem(Event event) :
    _eventViewModel = EventViewModel.fromEventMap(event);


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appLocation = S.of(context);
    Widget des = (_eventViewModel.actionDes == null ||
            _eventViewModel.actionDes.length == 0)
        ? Container()
        : Container(
            child: new Text(
              _eventViewModel.actionDes,
              maxLines: 3,
            ),
            margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
            alignment: Alignment.topLeft);

    Widget userImage = GSYUserIconWidget(
        padding: const EdgeInsets.only(top: 0.0, right: 5.0, left: 0.0),
        width: 30.0,
        height: 30.0,
        image: _eventViewModel.actionUserPic,
        onPressed: () {});

    return new Container(
      child: new Card(
          margin:
              EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
          child: new FlatButton(
              onPressed: () => {},
              child: new Padding(
                padding: new EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        userImage,
                        new Expanded(
                            child: new Text(_eventViewModel.actionUser,
                                style: theme.textTheme.subtitle2)),
                        new Text(StringUtils.getNewsTimeStr(appLocation, _eventViewModel.actionTime)),
                      ],
                    ),
                    new Container(
                        child: new Text(_eventViewModel.actionTarget,
                            style: theme.textTheme.subtitle2),
                        margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),
                    des,
                  ],
                ),
              ))),
    );
  }
}

class EventViewModel {
  String actionUser;
  String actionUserPic;
  String actionDes;
  DateTime actionTime;
  String actionTarget;

  EventViewModel.fromEventMap(Event event) {
    actionTime = event.createdAt;
    actionUser = event.actor.login;
    actionUserPic = event.actor.avatar_url;
    var other = getActionAndDes(event);
    actionDes = other["des"];
    actionTarget = other["actionStr"];
  }

  ///事件描述与动作
  static getActionAndDes(Event event) {
    String actionStr;
    String des;
    switch (event.type) {
      case "CommitCommentEvent":
        actionStr = "Commit comment at " + event.repo.name;
        break;
      case "CreateEvent":
        if (event.payload.refType == "repository") {
          actionStr = "Created repository " + event.repo.name;
        } else {
          actionStr = "Created " +
              event.payload.refType +
              " " +
              event.payload.ref +
              " at " +
              event.repo.name;
        }
        break;
      case "DeleteEvent":
        actionStr = "Delete " +
            event.payload.refType +
            " " +
            event.payload.ref +
            " at " +
            event.repo.name;
        break;
      case "ForkEvent":
        String oriRepo = event.repo.name;
        String newRepo = event.actor.login + "/" + event.repo.name;
        actionStr = "Forked " + oriRepo + " to " + newRepo;
        break;
      case "GollumEvent":
        actionStr = event.actor.login + " a wiki page ";
        break;

      case "InstallationEvent":
        actionStr = event.payload.action + " an GitHub App ";
        break;
      case "InstallationRepositoriesEvent":
        actionStr = event.payload.action + " repository from an installation ";
        break;
      case "IssueCommentEvent":
        actionStr = event.payload.action +
            " comment on issue " +
            event.payload.issue.number.toString() +
            " in " +
            event.repo.name;
        des = event.payload.comment.body;
        break;
      case "IssuesEvent":
        actionStr = event.payload.action +
            " issue " +
            event.payload.issue.number.toString() +
            " in " +
            event.repo.name;
        des = event.payload.issue.title;
        break;

      case "MarketplacePurchaseEvent":
        actionStr = event.payload.action + " marketplace plan ";
        break;
      case "MemberEvent":
        actionStr = event.payload.action + " member to " + event.repo.name;
        break;
      case "OrgBlockEvent":
        actionStr = event.payload.action + " a user ";
        break;
      case "ProjectCardEvent":
        actionStr = event.payload.action + " a project ";
        break;
      case "ProjectColumnEvent":
        actionStr = event.payload.action + " a project ";
        break;

      case "ProjectEvent":
        actionStr = event.payload.action + " a project ";
        break;
      case "PublicEvent":
        actionStr = "Made " + event.repo.name + " public";
        break;
      case "PullRequestEvent":
        actionStr = event.payload.action + " pull request " + event.repo.name;
        break;
      case "PullRequestReviewEvent":
        actionStr =
            event.payload.action + " pull request review at" + event.repo.name;
        break;
      case "PullRequestReviewCommentEvent":
        actionStr = event.payload.action +
            " pull request review comment at" +
            event.repo.name;
        break;

      case "PushEvent":
        String ref = event.payload.ref;
        ref = ref.substring(ref.lastIndexOf("/") + 1);
        actionStr = "Push to " + ref + " at " + event.repo.name;

        des = '';
        String descSpan = '';

        int count = event.payload.commits.length;
        int maxLines = 4;
        int max = count > maxLines ? maxLines - 1 : count;

        for (int i = 0; i < max; i++) {
          PushEventCommit commit = event.payload.commits[i];
          if (i != 0) {
            descSpan += ("\n");
          }
          String sha = commit.sha.substring(0, 7);
          descSpan += sha;
          descSpan += " ";
          descSpan += commit.message;
        }
        if (count > maxLines) {
          descSpan = descSpan + "\n" + "...";
        }
        break;
      case "ReleaseEvent":
        actionStr = event.payload.action +
            " release " +
            event.payload.release.tagName +
            " at " +
            event.repo.name;
        break;
      case "WatchEvent":
        actionStr = event.payload.action + " " + event.repo.name;
        break;
    }

    return {"actionStr": actionStr, "des": des != null ? des : ""};
  }
}
