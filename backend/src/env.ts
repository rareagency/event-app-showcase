import * as dotenv from 'dotenv';
import * as envalid from 'envalid';

const { str, port } = envalid;
dotenv.config();

export const env = envalid.cleanEnv(process.env, {
  DATABASE_URL: str({
    example: 'postgres://user:pass@host:5432/dbname'
  }),
  GRAPHQL_PORT: port({ default: 3000 })
});
