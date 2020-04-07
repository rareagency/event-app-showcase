String getScheduleEvents = """
query {
  scheduleEvents {
    nodes {
      startTime
      endTime
      pictureUrl
      title
      text
      location
    }
  }
}
""";