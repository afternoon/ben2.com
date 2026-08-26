---
layout: post
title: 'What I learned prototyping an ambitious web app with dynamic workflows'
date: '2026-08-17T18:04:14+00:00'
tags: ['ai', 'claude']
---
I got stuck for a while on a complex project (a web-based DAW with an AI assistant). I'd hacked a prototype, but I was a long way from being able to test the risky parts: if it was possible to build a DAW in the browser, and if it actually felt good to use.

While on holiday in an AirBnB in the woods, I decided to experiment with pushing the project forward with a multi-agent setup, specifically Claude's Dynamic Workflows. I wanted to learn if I could build something genuinely complex this way.

The prototype is live at [https://groove-35c07.web.app](https://groove-35c07.web.app). What follows is what I tried, in the order I tried it, and what each round taught me.

## V1: PRD, mocks, and a swarm of hungry agents

My starting hypothesis was: I can generate a PRD and some mocks, hand them to a swarm of agents and watch the magic happen.

I wrote up a few basic requirements, the product vision, and who I was building for, then had GPT 5.6 Sol turn that into a [PRD](https://github.com/afternoon/solid-groove/blob/main/docs/prd.md). I threw in the core technical choices from my prototyping: TypeScript, SolidJS, Firebase, Web Audio and Tone.js. I asked for a backlog. Both the PRD and the backlog were impressively detailed. I used Claude Design to create and iterate on some mocks, with the PRD as input, and saved those to the repo.

With Claude, I designed an initial workflow:

![Workflow v1](/images/what-i-learned-prototyping-ambitious-app-with-dynamic-workflows/v1.svg)

I kicked this off one night from my phone and woke up to a stack of PRs. Code review became the bottleneck immediately. Most people I've seen cluster at the extremes of the code review policy spectrum: review nothing, or review everything carefully. I realised I wanted a middle position. I don't care about most of the implementation *right now*, but I do want visibility into the major decisions, and enough of a feel for the codebase that I can care *later*. My bar was "I’ll accept this to unblock the prototype," not "I will defend this in SEV review."

The middle-way code review policy made a great learning exercise. I could see how Claude handled the Web Audio parts I'd found tricky and the patterns it picked for the app architecture. Claude made some production-grade choices I would have skipped. A command layer for all state changes, an explicit privacy stance, etc. These were genuinely good and I'm keeping them. There were several places I would have cut corners to move fast and Claude didn't, and because Claude produced the code, we didn’t have to compromise.

My janky on-my-phone-in-the-woods setup made doing a real deployment hard, so I skipped over it. This meant I had no visibility into the product as it evolved. I noticed the Playwright trace recordings from tests and those were so useful I codified them into the workflow, giving Claude instructions to attach walkthrough screenshots to PRs as evidence. These were essential, but Claude was oddly slippery about adding them. It would often forget, or rationalise its way out of doing it.

Another learning: Claude thinks out loud a lot and its exhausting trying to follow the saga. I spent time early on reading inner monologue that didn't help me. The subagents/workflows UI hid that, the main agent gave me concise status updates instead.

One definite improvement for Dynamic Workflows would be better handling of approvals on mobile. Every change to the workflow script itself requires approval, and runs would get stuck when I started one before going to bed run, or interrupt me during time off.

## V2: GH issues as the interface

I realised I had no good visibility into the project plan. I built a [GitHub board](https://github.com/users/afternoon/projects/2/views/1) and had Claude generate issues for outstanding work. Then I asked it to visualise the dependency graph. This revealed a plan that required a lot dependencies and serial work. No embarrassing parallelism here. I asked Claude to identify sources of blockers and merge conflicts and recommend fixes. It suggested the usual mix of changes: break this component down, register interfaces first, keep PRs small. We made changes to the code and the project agent context before starting the next round of feature work.

At this point I'd started thinking more like an EM running a team. Issues were a better level of abstraction than raw agent output for this mode: focused chunks of work, a description, a task checklist, and a PR with notes. I could focus on the progress towards the project goal, and the bottlenecks and blockers slowing my team down.

Around here a workflow died on me one night, possibly a transient cloud issue. I decided to try a different workflow: create an issue, tag Claude in a comment to kick off implementation, configure Claude to review new PRs automatically.

![Workflow v2](/images/what-i-learned-prototyping-ambitious-app-with-dynamic-workflows/v2.svg)

It worked, but it needed constant manual nudging. If the review requested changes, I had to kick off the follow-up myself. In theory you could automate the gaps. In practice the Dynamic Workflow already did it better, so I quickly pivoted back to that approach.

## Cloud vs. local

Back on Dynamic Workflows, I hit friction with Anthropic's cloud. All agents for a workflow ran on the same 4-VCPU VM, which capped parallelism, and the instances were missing pieces I needed: the gh command, a sound device, the ability to install Playwright browsers. I tried running the workflows on my laptop. The environment setup was better, but my aged MBP just could not cope. Agents doing parallel test runs caused it to overheat and lock up several times. 2 concurrent agents was the stable maximum.

Another issue I noticed: when CI broke, every agent would get stuck on the same thing and cycle between trying to fix it and trying to convince itself it wasn't its fault. There was a GitHub Actions outage one night and all my agents just ran around in circles until it was resolved. A better workflow would check for CI failures, stop, fix that, and then restart the feature work.

I started tweaking context to steer Claude towards my preferences more: create smaller PRs, create smaller components, and so on. I did some small refactorings to make later changes easier to read at review time.

## V3: an anthropocentric workflow

Back to the cloud. Killing the laptop is a hard no.

Increasingly I realised I need a workflow centred around me and what I need to do to move the project forward. Before implementing a feature, I wanted to understand what we were building better and make sure it was thought through. After implementation, I wanted code changes that were easy to understand and review. So I captured those in a new version of the workflow.

![Workflow v3](/images/what-i-learned-prototyping-ambitious-app-with-dynamic-workflows/v3.svg)

I’m now more involved in the spec process before feature implementation kicks off, so I can refine the requirements early. The final PRs are tweaked to be much easier for a human to understand and to either accept or push back on.

## Learnings


Claude unblocked a project that was stuck. The Web Audio work was sufficiently tricky that I couldn't get through it with my limited time for side-projects. Claude built infrastructure around the problem — tests that generate offline audio, driving Chrome to listen to real audio output when something was broken — and that made the project tractable. Dynamic Workflows produced a lot of code, fast. Setting an explicit goal to move fast forced me to make product decisions quickly and document them. As a result I'm much closer to a prototype that I can use to test the fundamental product hypothesis.

Some of the tactics that worked well are agentic variations of classic software design and project management techniques. Using context in repo docs and skills to steer agents toward the code you want is the equivalent of retrospecting with your colleagues on how you're working and improving your tools and processes. Using tools like an issue tracker for the backlog, thinking in terms of core flows. Using agents to reason about the design, visualise dependencies, planned workstreams, the architecture, and to identify bottlenecks and weak spots is also a great form of retrospection.

If you code fast, you are delaying the pain. Bugs pile up silently. The product diverges from what was in your head. Repetition and variance seeps into the code. Building this by hand, I'd have stopped and tested at each step and fixed many small things earlier. There's a lot of work to do on this project to get a good enough experience even to show friends. The code is undoubtedly a timebomb if I ever point real customers at it.

If I were reviewing code for a real product I would slow down massively, but for a prototype I should probably just get out of the way and plan to understand and refactor the slop later, as [Mario Zechner argues](https://www.youtube.com/watch?v=RjfbvDXpFls). I should dedicate more time to testing the end user experience instead.

I spent a lot of time managing the sequence and status of work and on operational gotchas like merge conflicts. Claude did the legwork, but the coordination wasn't fun. Keeping agents from overlapping is an unsolved problem. This used to be a human engineering problem, solved through team coordination. [James Brown talked about this in a recent Developer Voices podcast](https://www.youtube.com/watch?v=JCPrxKse4YQ). The canonical Dynamic Workflow test case, the [Bun Rust rewrite](https://bun.com/blog/bun-in-rust), seems to have handled this with 1:1 allocation of agents to files, which is beautifully simple. I hacked around it by periodically stopping the machine and refactoring, but I often had to tag Claude to fix PR merge issues as a final step.

The Dynamic Workflow stack feels raw. It assumes local development, and the experience is not always smooth. Expect to need to tend the machine, and to try different workflows. Some way to push tasks to the fleet and have the results land in PRs would be nice.

