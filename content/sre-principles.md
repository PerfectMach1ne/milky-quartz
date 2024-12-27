---
title: SRE principles
draft: false
tags:
  - sre
  - monitoring
---

# SRE principles

## Monitoring

Concepts from [João Pereira's 52 weeks of SRE (W2)](https://jpereira.me/week-2-monitoring-fundamentals/)

### Black-box and white-box

A name familiar from testing concepts; we can also categorize **monitoring** into these two:

> [!info]- White-box monitoring
>
> Examines system internals and detailed metrics.
> Provides insights into system behaviour and performance.
> > [!example]
> > 
> > - Memory usage and garbage collection metrics.
> > - Database query performance.
> > - Internal queue lenghts *(e.g. monitoring a Kafka consumer's offset lag)*.
> > - Cache hit rates.
> > - Application-specific metrics.

> [!info]- Black-box monitoring
>
> - Test system behaviour from the outside, like how an end user would experience it.
> - Focuses on system outputs and external behaviours.
> > [!example] Examples
> >
> > - HTTP endpoint availability checks *(can I reach this endpoint?).*
> > - API response time measurements *(is this request taking too long?).*
> > - End-to-end transaction tests *(did this operation fulfill all of its requirements?).*

### Alerts

An alert's **rule** defines the conditions that trigger the alert. Typically an alert also has severity attached to it.\
One of the best practices for setting up alerts is ensuring that **all alerts are actionable**:

> *Every alert **should require human intervention** and have a **clear resolution path**. If an alert is triggered but there's nothing an engineer can do to resolve it, then **it shouldn't be an alert**.*

Make sure rules are not too *permissive* nor *aggressive* to avoid *alarm fatigue*.

Another one is **alerting symptoms rather than causes**, e.g.:

> [!success]- Recommended examples
>
> - *API success rate below 99.9%*
> - *Payment processing latency > 10s*
> - *Error rate exceeded 5% in the last 5 mins*

> [!fail]- Not recommended examples
>
> - *High CPU usage on an API server*
> - *Network packets received have increased*
> - *Low disk space on server*

The handling of situations from not recommended examples can often be **automated with auto-scaling or failover mechanisms** (if truly necessary).

### Dashboard strategies

> [!info]- USE method
>
> For **monitoring infrastructure**; best used for building dashboards that track hardware resources in infrastructure, such as CPU, memory, and network devices. *It tells you how **happy** your machines are*.
> - **Utilization**: Percentage time the resource is busy (e.g.: CPU usage).
> - **Saturation**: Amount of work a resource has to do (e.g.: queue length).
> - **Errors**: Count of error events.

> [!info]- RED method
>
> For monitoring **user experience**; most applicable to building dashboards for services, especially a microservices environment. A well-designed RED dashboard is a *proxy for **user experience***, telling you *how happy your customers are.*
> - **Rate**: Requests per second
> - **Errors**: Number of failing requests
> - **Duration**: Request latency distribution

> [!info]- The Four Golden Signals
>
> According to the [Google SRE handbook](https://sre.google/sre-handbook/), if you can ***only*** measure **four metrics** of your **user-facing system**, focus on these four.
> - **Latency**: Time to serve requests
> - **Traffic**: System demand
> - **Errors**: Failed request rate
> - **Saturation**: System fullness

Types of dashboards, in short:

1. **Overview dashboards** (general system health checks, rapid anomaly detection).
2. **Service-specific dashboards** (detailed data for specific services and their internals).
3. **Business metric dashboards** (for non-technical stakeholders and business-relevant data).

#### Dashboard best practices

1. Line-graphs ([[prometheus | time-series data]])
    - Ideal for latency, request volumes & error rates
    - Shows variations over time
    - Trend analysis
2. Gauges (utilization metircs)
    - Ideal for CPU, memory, Service Level Objectives
    - Shows current values within defined ranges
    - Quick visual reference for usage and limits
3. Tables (detailed breakdowns)
    - Ideal for complex reports & database queries
    - Multiple dataset visualization
    - Detailed analytical view
4. Heat-maps (distribution)
    - Ideal for pattern identification over time
    - Value distribution visualization
    - Temporal pattern analysis

