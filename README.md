# AISViz Website

Static website for the [AISViz](https://github.com/MAPS-Lab) project, a research initiative at
Dalhousie University focused on making maritime informatics accessible to everyone through
open-source tools built around Automatic Identification System (AIS) data.

The site is served by GitHub Pages at [https://aisviz.cs.dal.ca](https://aisviz.cs.dal.ca) (custom
domain configured in `CNAME`). Every push to `main` deploys automatically, so no workflow or build
step is involved.

## Contents

| File | Purpose |
|------|---------|
| `index.html` | Landing page (Bootstrap 5, Font Awesome via CDN) |
| `style.css` | Site-specific styles |
| `CNAME` | Custom domain for GitHub Pages |

Instructions for setting up an AIS receiver and forwarding decoded messages to the AISViz server
live in the hardware section of the [documentation](https://aisviz.gitbook.io/documentation/).

## Local preview

No build step is required. Open `index.html` directly in a browser, or serve the directory
locally:

```bash
python3 -m http.server 8000
```

Then visit http://localhost:8000.

## Documentation

- [Documentation](https://aisviz.gitbook.io/documentation/)
- [Tutorials](https://aisviz.gitbook.io/tutorials/)
- [API reference](https://aisviz.cs.dal.ca/AISdb/)
- [Website](https://aisviz.cs.dal.ca/)

## Related projects

- [AISdb](https://github.com/MAPS-Lab/AISdb) is the Python package for smart AIS data storage and
  integration.
- [AISdb-lite](https://github.com/MAPS-Lab/AISdb-lite) is a lightweight version of AISdb with
  spatio-temporal capabilities on PostGIS and TigerData.
- [NOAA-Integrator](https://github.com/MAPS-Lab/AISdb-NOAA-Integrator) acquires and processes Marine
  Cadastre AIS data into an AISdb-aligned database.
- [Tutorials](https://github.com/MAPS-Lab/AISdb-Tutorials) holds hands-on Jupyter notebooks that walk
  through AISdb, from database loading to bathymetry.

## License

The site scaffolding is released under the [MIT License](LICENSE).
