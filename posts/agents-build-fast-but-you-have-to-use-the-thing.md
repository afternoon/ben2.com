---
layout: post
title: "Agents Build Fast But You Have To Use The Thing"
date: "2026-08-17T18:04:14+00:00"
tags: ["agentic-engineering", "claude"]
description: "Tests passed, CI was green, review said fine, and every one of those criteria was satisfied by code that was going the wrong way. ## Everything I asked to be checked, was The temptation is to conclude I forgot to give the agents the product context."
---
Dynamic workflows can build genuinely complex software. Over about four weeks of evenings and one holiday, Claude merged 150 PRs into [Groove](https://github.com/afternoon/solid-groove), my web-based DAW side project — 45 of them in a single day — turning a stuck prototype into an app I could [deploy and open](https://groove-35c07.web.app).

Then I started using it, and found the implementation had drifted a long way from the product I described. The library panel was in the wrong place, and hidden. The instrument panel is a mess. Copying a section of a sequence works through a row of buttons carrying enormous labels, in an interaction pattern no producer would recognise. Critical flows — like dragging a sample from the library onto a track — didn't work at all. The library was there. The sampler was there. The integration between them wasn't specified anywhere, so nobody built it.

Coordinating agents is a pain point, which I'll come back to, but validating the product is _right_ is the real bottleneck. The code silently drifts from the vision at every step. Agents optimise against what they can check. Tests passed, CI was green, review said fine, and every one of those criteria was satisfied by code that was going the wrong way.

## Everything I asked to be checked, was

The temptation is to conclude I forgot to give the agents the product context. That isn't what happened. I used GPT 5.6 Sol to create a [PRD](https://github.com/afternoon/solid-groove/blob/main/docs/prd.md) which was comprehensive and the agents read it regularly. I used Claude Design to create mocks and saved them to the repo. The [workflow implementer prompt](https://github.com/afternoon/solid-groove/blob/main/.claude/agents/solid-groove-implementer.md) says the design mocks are authoritative for visual language and that screens without a mock must be extrapolated from the documented design DNA rather than inventing a second one. The instructions were there and they were reasonably good. They lost anyway, because "matches the mock" and "moves us towards the product" aren't checkable the way "CI is green" is.

Subjectively, each subagent worked in isolation on its increment without being able to verify if it was moving towards the goal. It read the PRD, satisfied its issue, went green, and stopped. The code review agent checked that what was built was built right, not that the right thing was being built. The drag-a-sample-to-a-track flow fell exactly between two well-built components, each of which had passed everything it was asked to pass.

This is not a new problem, and it isn't an agent problem. It's the classic integration failure of any team working in parallel, where the integration point at the end of a project — or the end of a week — quietly grows into a significant fraction of the total time. We've known this for decades. Agents don't create it; they just let you reach it in a fortnight instead of a quarter.

I did eventually build the mechanism that catches this. Late in the project, at PR #220 of 264, I introduced the concept of [core flows](https://github.com/afternoon/solid-groove/blob/main/docs/core-flows.md). A core flow is a user journey through the product, written in plain English before any code exists, with a stable ID that an issue links to, an E2E spec is named after, and a screenshot walkthrough is captured from. A core flow is checkable in a way a PRD isn't, and the drag-to-track gap is exactly the kind of thing that would have been caught trivially.

## The feedback loop, not the code review

The root cause is boring and obvious: I didn't dogfood.

I kicked off the workflows while travelling, from a phone, with a setup that made real deployments hard. I didn't deploy for over a week. I decided to keep going rather than pause for testing — that pushing on to a more complete prototype and polishing afterwards was the efficient move. What I was actually doing was letting a fleet of agents run for a week with no signal about whether the product was any good.

I started dogfooding the day the first production deploy went up, and the divergence was obvious immediately. Not subtle, not a matter of taste: obvious within minutes of using it. It had also been visible earlier, in screenshots attached to PRs. A screenshot tells you a screen renders. Using the thing tells you the screen is in the wrong place, and that the flow you care about doesn't exist. I dismissed the issues in screenshots as minor, but they were great signal of issues creeping in.

Anything not in the loop drifts. Everything that *was* in the loop — types, tests, lint, review — held up fine. Green CI runs are a vanity metric. The core journeys I really cared about weren't in the loop, so they didn't happen.

## What was actually good

I won't be throwing the prototype away, the agents did a great job on the lower-level infrastructure. The data model is sound. The command layer — every state change routed through one place — is a production-grade choice I'd have skipped under time pressure, and it makes undo, shortcuts and analytics much cheaper later. The Web Audio layer works, and that was the part I couldn't get through in the time I have for side projects. Claude built scaffolding that made it tractable: tests that render audio offline, driving Chrome to listen to real output when something broke. Painting tracks onto a `<canvas>` and the step editing both produced solid fundamental code.

What needs heavy iteration is the UI, and some of it needs reimagining rather than polish. The parts that held up are the parts whose correctness a machine can check: does the audio graph produce the right samples, does the command replay, does the canvas draw where the maths says. The parts that drifted are the ones where correctness means "a producer would love this product," which no test in the repo asserts.

The work ahead is to get the interaction patterns closer to what other DAWs do — which matters, because the point is to help producers learn and move on to professional tools — and to reimagine the parts that are just painful to use.

## Coordination, the other bottleneck

Coordination was more painful than I expected. I spent a lot of time on it.

I built a [GitHub board](https://github.com/users/afternoon/projects/2/views/1), had Claude generate issues for the outstanding work, then asked it to visualise the dependency graph. The plan was almost entirely serial — no embarrassing parallelism here. I asked Claude to identify the sources of blocking and merge conflicts and recommend fixes, and it came back with the answers any tech lead would give: break this component down, register the interfaces first, keep the PRs small.

Keeping agents from overlapping is unsolved. This used to be a human problem, solved by standups, ownership boundaries and someone noticing two people were about to touch the same file, as [James Brown discussed on Developer Voices](https://www.youtube.com/watch?v=JCPrxKse4YQ). The canonical dynamic workflow test case, [Bun's Rust rewrite](https://bun.com/blog/bun-in-rust), handles it by allocating one agent per file, which is beautifully simple and only works when the work decomposes that cleanly. My project didn't decompose as cleanly. The seams were still emerging as the app grew. I hacked around it by periodically stopping the machine and refactoring, and still had to tag Claude to resolve merge conflicts on many PRs.

Related: when CI broke, every agent got stuck on the same thing, cycling between trying to fix it and trying to convince itself it wasn't at fault. There was a GitHub Actions outage one night and the whole fleet ran in circles until it cleared. Agents have no shared signal for infrastructure-level failure, so each one attributed a global outage to its own local change.

Issues turned out to be a good level to supervise at. Raw agent output is too low — a firehose of diffs and monologue. An issue is a focused chunk of work with a description, a checklist and a PR attached. I'd started thinking like an EM running a team rather than an engineer writing code, and issues are the mental model I have pattern recognition for.

## Notes from the machine room

A few things worth recording:

Code review became the bottleneck the first morning. Most people cluster at the extremes — review nothing, or review everything carefully — and I wanted a middle position: I don't care about most of the implementation *right now*, but I want visibility into the major decisions and enough feel for the codebase to care *later*. My bar was "I'll accept this to unblock the prototype," not "I will defend this in SEV review."

Anthropic's cloud ran every agent in a workflow on one 4-vCPU VM, which capped parallelism, and the instances lacked the `gh` command, a sound device, and the ability to install Playwright browsers. Running locally fixed the environment and killed my aged MBP instead — parallel test suites overheated it and locked it up repeatedly, with two concurrent agents the stable maximum. Killing the laptop is a hard no, so: back to the cloud.

Claude was consistently reluctant to attach the walkthrough screenshots I'd asked for, forgetting or reasoning its way out of the requirement. Instruction adherence degrades on secondary objectives as a run gets long. Same lesson as the mocks: anything you need every time belongs in a check the agent can't argue with.

Claude also thinks out loud a lot, and following the saga is exhausting. The subagents and workflows UI hides it and gives you concise status updates instead, which is the right default. Approvals on mobile need work — every change to the workflow script needs one, so runs stalled overnight or interrupted me during time off.

## You have to use the thing

The conclusion is embarrassingly obvious: use the product you are building, continuously, from the first day there is anything to use. Everyone knows this. I know this. I have told other people this. I still spent a week letting a fleet of agents build a DAW I had never once opened.

It's worth being precise about why the obvious thing didn't happen, because "be more disciplined" is not a mechanism. Deployment was genuinely awkward from a phone in the woods, so skipping it was locally reasonable each night. Every signal I *did* have was green, and green signals feel like progress. And I had a plausible-sounding argument for deferring — get to a more complete prototype, then polish — which is exactly the kind of reasoning that sounds like strategy and functions as avoidance. The failure wasn't ignorance. It was that nothing in my setup forced the issue, and I'd built a story for why it was fine.

Brooks got here first, and then thought better of it. *The Mythical Man-Month* tells you to plan to throw one away, because you will anyhow. Twenty years later he recanted. The advice assumed you build the whole thing before you learn anything, and incremental development with regular demos solves that. The first version does tell you more about what you want than any PRD or set of mocks can — especially ones generated quickly with an agent, which look far more authoritative than the thinking behind them warrants. My PRD and mocks were impressively thorough and both lacked the golden moment of joy. Using it told me in about a minute. What agents change is that the throwaway is now cheap and the *learning* is the expensive part.

So, when you start building a product, write down the steps you want to take to get to the first payoff. Maybe you can use another product and write down what you did. Maybe the internet is full of videos of other people getting that first moment of joy with other similar products. Then let the agents build that. Then do it again. That's the loop.
