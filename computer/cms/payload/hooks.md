Collection hooks example:

  hooks: {
    afterRead: [({ context, doc }) => {
      const pois = context.pois || {}
      pois[doc.id] = doc
      context.pois = pois
      return doc // Is this necessary?
    }]
  }

Field hooks example:

  hooks: {
    afterRead: [args => {
      console.log('POIReference afterRead args.req', args.value)
      return args.value
    }]
  }

