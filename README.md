# demo_backstage

Demo to have IaC setup and automation for https://backstage.io

## Usage

### Init Backstage

```
nvm use 14
npx @backstage/create-app --version
npx @backstage/create-app
> demo
> PostgreSQL
```

### Build Backstage

```
cd demo
nvm use 14
yarn build
yarn workspace backend build-image
docker images | grep backstage
```

### Run

```
GITHUB_PERSONAL_ACCESS_TOKEN=<your_personal_access_token> make up
open http://localhost:7000
```

### Extending

To integrate please follow the instruction provided on the referenced pages.
Aside of adding the package further changes in the source code have to be applied.

```
cd demo

yarn workspace backend add @backstage/plugin-lighthouse
# + https://github.com/backstage/backstage/tree/master/plugins/lighthouse
```

#### Tech Documentation

- [Cloud Storage Backend Configuration](https://backstage.io/docs/features/techdocs/using-cloud-storage)

### Upgrade Backstage

- [ ] TODO Describe backstage update process for existing setup `demo`.

## References

- [Local Development Environment](https://roadie.io/blog/backstage-docker-service-catalog/#:~:text=Backstage%20comes%20with%20a%20built,to%20build%20one%20Docker%20image.)
- [Backstage: Adding your own Templates](https://backstage.io/docs/features/software-templates/adding-templates)
- [Alternative: Clutch](https://clutch.sh/blog/2020/07/22/announcing-clutch/)
