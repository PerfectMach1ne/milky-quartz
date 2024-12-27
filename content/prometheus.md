---
title: Prometheus
draft: false
tags:
  - sre
  - monitoring
  - prometheus
---

# Prometheus

Prometheus is a tool for **collecting** data for monitoring purposes. Basically it's one of the "backend options" for **monitoring visualization** tools such as [[grafana | Grafana]].

## Time-series data

A concept fundamental to data collected by Prometheus. It's as if there was a collection of **same-type ordered pairs of some metric m and measured time t**; "time measured" typically refers to either absolute time or time recorded in relation to Prometheus or its data source being started.
