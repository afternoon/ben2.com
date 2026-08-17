---
layout: post
title: 'What I learned prototyping an ambitious web app with dynamic workflows'
date: '2026-08-17T18:04:14+00:00'
tags: ['ai', 'claude']
---
I got stuck for a while building Groove – a web-based DAW with an AI assistant. I'd hacked a prototype, but it was moving slowly and I felt a long way from being able to test what I really cared about: if it was possible to build a DAW in the browser, and if it actually feelt good to use.

While on holiday with my family in an AirBnb in the woods, I decided to experiment with a multi-agent setup, specifically Claude's Dynamic Workflows, to push the project forward. I wanted to learn if I could build something genuinely complex this way.

The prototype is live at [https://groove-35c07.web.app](https://groove-35c07.web.app). What follows is what I tried, in the order I tried it, and what each round taught me.

## V1: PRD, mocks, and a swarm of hungry agents

My starting hypothesis was: given a few rough notes, I could generate a PRD and some mocks, hand them to a swarm of agents and get out of the way.

I wrote up a few basic requirements, the product vision, and who I was building for, then had GPT 5.6 Sol turn that into a [PRD](https://github.com/afternoon/solid-groove/blob/main/docs/prd.md). I threw in the core technical choices from my prototyping: TypeScript, SolidJS, Firebase, Web Audio and Tone.js. I asked for a backlog. Both were absurdly detailed, I didn't really read them. Next, I used Claude Design to create and iterate on some mocks, with the PRD as input, and saved those to the repo.

With Claude, I designed an initial workflow:

![Workflow v1](/images/what-i-learned-prototyping-ambitious-app-with-dynamic-workflows/v1.svg)

I built this with Claude on my phone and started it, which meant it ran on Anthropic's cloud.

I'd upgraded to Max to get more token budget. A not-entirely-unexpected side-effect of this was that every hour my agents weren't working felt like budget I hadn't used. It nudged me to keep things moving forward, and I didn’t stop to think too much. A lot of engineers feel similar urgency right now, either caused by FOMO or by direct pressure from their organisation. The software industry is susceptible to hype, and this is the cycle we’re in right now.

The first thing I noticed compared to my regular solo projects was a lot of PR ceremony, merging, tidying up branches, etc, for even small changes. Creating PRs for each change felt redundant for a pre-launch solo project. Later I twigged it was the essential isolation and coordination mechanism that let multiple agents work at once.

As the agents churned away, code review became the bottleneck immediately. Most people I've seen cluster at the extremes of the code review policy spectrum: review nothing, or review everything as carefully as you'd review a colleague's code. I realised I wanted a middle position.  I don't care about most of the implementation *right now*, but I do want visibility into the major decisions, and enough of a feel for the codebase that I can care later. My bar was "I’ll accept this to unblock the prototype," not "I will defend this in SEV review." I spent a few days reviewing 3,000-line PRs, feeling pressure to get through them so the agents could start up again.

One benefit of the middle-way code review policy was that it made a great learning exercise, to see how Claude handled the Web Audio parts I'd found tricky, and what patterns it picked for the app architecture. Claude made some production-grade choices I would have skipped. A command layer for all state changes, an explicit privacy stance, etc. These were genuinely good and I'm keeping them. There were several places I would have cut corners to move fast and Claude didn't, and because Claude produced the code, we didn’t have to compromise.

My janky on-my-phone-in-the-woods setup made doing a real deployment hard, so I skipped over it, but this meant I had no visibility into the product as it evolved. I noticed the Playwright trace recordings from tests and those were so useful I codified them into the workflow, giving Claude instructions to attach walkthrough screenshots to PRs as evidence.

Another learning, Claude thinks out loud a lot and it gets exhausted trying to follow its journey. I spent a bunch of time reading inner monologue that didn't help me. The subagents/workflows UI hid that, which was an improvement: the main agent gave me status updates instead of a running commentary on which commands failed.

One definite improvement for Dynamic Workflows would be better handling of approvals on mobile. Every change to the script would require approval, and they would get stuck when I started an overnight run, or interrupt me during time off. Anthropic could polish this, though people driving workflows entirely from a phone are probably a minority.

## V2: issues as the interface

I realised I had no good visibility into the project plan. It existed in the PRD, but was buried in a huge wall of text. I built a [GitHub board](https://github.com/users/afternoon/projects/2/views/1) and had Claude generate an issue for each outstanding piece of work. Then I asked it to visualise the dependency graph. This revealed a plan that required a lot of work to be sequenced. No embarrassing parallelism here. I asked Claude to identify sources of blockers and merge conflicts and recommend fixes. It suggested the usual mix of break this component down into smaller components, register interfaces first, keep PRs small. We made changes to the code and the project agent context in a session with some subagents and merged them before starting the next round of feature work.

At this point I'd started thinking more like an EM running a team. Issues were a better level of abstraction than raw agent output for this mode: focused chunks of work, a description, a task checklist, and a PR with notes. I could focus on what mattered more easily.

Around here a workflow died on me, possibly transient cloud infrastructure trouble. I decided to try a different workflow: create an issue, tag Claude on it to kick off implementation, and configure Claude to review new PRs automatically.

![Workflow v2](/images/what-i-learned-prototyping-ambitious-app-with-dynamic-workflows/v2.svg)

It worked, but it needed constant manual nudging. If the review requested changes, I had to kick off the follow-up myself. In theory you could automate the gaps. In practice the Dynamic Workflow already did it better, so I quickly pivoted back to that approach.

## Cloud vs. local

Back on Dynamic Workflows, I hit friction with Anthropic's cloud. It ran on a 4-core VM, which capped parallelism, and the instances were missing pieces I needed: the gh command, a sound device, the ability to install Playwright browsers. I tried running the workflows on my laptop. The environment setup was better, but my aging MBP could not cope. I got it to overheat and lock up several times while agents did multiple parallel test runs. 2 concurrent agents was the stable maximum.

Another issue I noticed around this time that triggered my EM pattern recognition, when CI broke, every agent would get stuck on the same thing and cycle between trying to fix it and trying to convince itself it wasn't their fault. There was a GitHub Actions outage one night and all my agents just ran around in circles until it was resolved. A better workflow would check for CI failures, stop, fix that, and then restart the feature work.

I started tweaking context to steer Claude more: smaller PRs, smaller components, and so on. I did some small refactorings purely to make later changes easier to read at review time.

I was also spending a lot of time managing the sequence and status of work. Claude did the legwork, but the coordination wasn't fun. Again, doing this from my phone, I probably brought that on myself.

## V3: the anthropocentric workflow

Back to the cloud. Killing the laptop is a hard no.

Increasingly I realised I need a workflow centred around me and what I need to do to move the project forward. Before implementing a feature, I wanted to understand what we were building better and make sure it was thought through. After implementation, I wanted code changes that were easy to understand and review. So I captured those in a new version of the workflow.

![Workflow v3](/images/what-i-learned-prototyping-ambitious-app-with-dynamic-workflows/v3.svg)

I’m now more involved in the spec process before feature implementation kicks off, so I can refine the requirements early. The final PRs are tweaked to be much easier for a human to understand and to either accept or push back on.

## Learnings

The prototype is still very much in progress. Some things I'm fairly confident about:

Claude unblocked a project that was stuck. The Web Audio work was tricky and I couldn't dedicate enough bandwidth to figure it out properly. Claude built infrastructure around the problem — tests that generate offline audio, driving Chrome to listen to real audio output when something was broken — and that made the project tractable. This project would have been indefinitely stuck otherwise.

Dynamic Workflows produced a lot of code, fast. The need to feed the beast forced me to make product decisions quickly and document them. As a result I'm much closer to a prototype that I can use to test the fundamental product hypothesis.

The code is a timebomb if I ever point real customers at it.

I am the bottleneck. For a real app I should slow down. For a prototype I should get out of the way and plan to refactor the slop later, as [Mario Zechner argues](https://www.youtube.com/watch?v=RjfbvDXpFls).

Keeping agents from overlapping is an unsolved problem. This used to be a human engineering problem, solved through team coordination. [James Brown talked about this in a recent Developer Voices podcast](https://www.youtube.com/watch?v=JCPrxKse4YQ). The canonical Dynamic Workflow test case, the [Bun Rust rewrite](https://bun.com/blog/bun-in-rust), seems to have handled this with 1:1 allocation of agents to files, which is beautifully simple. I hacked around it by periodically stopping the machine and refactoring, but I often had to tag Claude to fix PR merge issues as a final step.

The Dynamic Workflow stack feels raw. It assumes local development, and the experience is not always smooth. Expect to try lots of things.

If you code fast, you are delaying the pain to the point of QA, or deployment. Bugs pile up silently. The product diverges from what was in your head. Repetition and variance seeps into the code. Building this by hand, I'd have stopped and tested at each step and spotted these things earlier. I now have a large batch of testing, bug filing, fixing and polishing ahead of me. Each has benefits, polishing one thing at a time is tractable, but its easy to get stuck in the rut of having one polished feature and 99 unstarted ones. Batching QA feels sensible, in one walkthrough of a core flow, I might spot 5 bugs, and then I can task 5 agents to fix them.

## Things I wish I'd done sooner

* Set up deployment. I accumulated a lot of code before I looked at any of it running.
* Started steering agents via context. The moment something felt off — PR size, what got tested, image walkthroughs showing UI evolution — I should have stopped the line and improved the workflow.
* Visualised dependencies and planned workstreams. This reduced clashes immediately once I did it.
* Thought in terms of core flows. This was the mental model that let me understand what Claude was planning to do at the feature level, and was more accessible than reading the entire dry PRD, and helped me refine the plan before implementation.

