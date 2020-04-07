import PgSimplifyInflectorPlugin from '@graphile-contrib/pg-simplify-inflector';
import * as http from 'http';
import postgraphile from 'postgraphile';

import { env } from './env';

http
  .createServer(
    postgraphile(env.DATABASE_URL, 'public', {
      appendPlugins: [PgSimplifyInflectorPlugin],
      watchPg: true,
      graphiql: true,
      enhanceGraphiql: true
    })
  )
  .listen(env.GRAPHQL_PORT);

console.log(`
GraphQL server: http://localhost:${env.GRAPHQL_PORT}/graphql
GraphiQL server: http://localhost:${env.GRAPHQL_PORT}/graphiql
`);
