const pageViewPathKey = "analytics:lastPageViewPath"

const currentPath = () => `${window.location.pathname}${window.location.search}`

const normalizeParams = (params = {}) => {
  return Object.entries(params).reduce((accumulator, [key, value]) => {
    if (value === undefined || value === null || value === "") return accumulator
    accumulator[key] = value
    return accumulator
  }, {})
}

const sendEvent = (eventName, params = {}) => {
  if (typeof window.gtag !== "function") return
  window.gtag("event", eventName, normalizeParams(params))
}

const trackPageView = () => {
  if (typeof window.gtag !== "function") return
  const path = currentPath()
  if (window[pageViewPathKey] === path) return
  window[pageViewPathKey] = path
  sendEvent("page_view", {
    page_location: window.location.href,
    page_path: path,
    page_title: document.title
  })
}

const readDataset = (element, key) => {
  return element.dataset[key] || element.getAttribute(`data-${key.replace(/[A-Z]/g, (letter) => `-${letter.toLowerCase()}`)}`)
}

const trackClickEvents = (event) => {
  const trigger = event.target.closest("[data-analytics-event]")
  if (!trigger) return

  const eventName = trigger.dataset.analyticsEvent
  if (!eventName) return

  sendEvent(eventName, {
    source: trigger.dataset.analyticsSource,
    label: trigger.dataset.analyticsLabel,
    path: currentPath(),
    destination: trigger.getAttribute("href")
  })
}

const trackSubmitEvents = (event) => {
  const form = event.target
  if (!(form instanceof HTMLFormElement)) return

  const eventName = readDataset(form, "analyticsEvent")
  if (!eventName) return

  sendEvent(eventName, {
    source: readDataset(form, "analyticsSource"),
    path: currentPath()
  })
}

const bindAnalytics = () => {
  trackPageView()
}

document.addEventListener("turbo:load", bindAnalytics)
document.addEventListener("click", trackClickEvents)
document.addEventListener("submit", trackSubmitEvents)

window.appTrack = sendEvent
